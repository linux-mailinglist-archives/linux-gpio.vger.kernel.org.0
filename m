Return-Path: <linux-gpio+bounces-31158-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDxSGsLAeGn6sgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31158-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 14:42:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CFF9507A
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 14:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 359A1309167B
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 13:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8405358D12;
	Tue, 27 Jan 2026 13:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ChYnVqwN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4573587CA;
	Tue, 27 Jan 2026 13:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769521080; cv=none; b=t03YDcJYFfz2Qhvi/W4Uy4JJBa3bXyZoYMA6fB6RvEPB9ljC/HymA6Cs4tg71JMIe42pf9TIWppkwTz1DkVcelMxFyjWsjGFpdJ4wJKyuw/xP5qHC2OaVSGw+4yz8fREy41RrMxa9BtKkVwm4mWfqtG42Y+TZt/Gq9O1BiBr1Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769521080; c=relaxed/simple;
	bh=2o9XeiaV+pV1m7JV1xysf2I4EcAw0dYDb9YlHz6XTow=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=W/pO+EQWBYXqFa83z+BzslmW6XqF0KHrugsB5bMLS7OutDaFCf7xXvVvVKnyX3Qah5Bp5mHVnZbgnr2/FCtSxKRPopl43Uj3fNKsg5sD78ykgs+OFdUQgg0sBT0KBZQFezhbOljzJ3TprMaz8AskPBxgLedxC/7kF02eFYwBNv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ChYnVqwN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77B4FC116C6;
	Tue, 27 Jan 2026 13:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769521080;
	bh=2o9XeiaV+pV1m7JV1xysf2I4EcAw0dYDb9YlHz6XTow=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=ChYnVqwNpVDugUrDdZgiGSiXdpOB0lzmvSQTNGypGi9uSB345QwCpeKyVwh9JSLZ2
	 AtEWFMU+ZdO1LWnJcYviWH+/EOsMuvd/CZ9SnSN1rRfoKs2pEcCW6yqN+ghPaYruB0
	 ItHkeVaB0IfHSUAISyujeJK6wqhgZf3cEVkoSmya58enc46jl42+5rPcLKCAUoo+j6
	 wAJwHH1bauMxKo+A3UkqYtlrT3bMZxikAGkSSKG5jUEbcFF2wq0fZSR18dedAuRa2y
	 4+WiJesTIjwS5c+mZwR61h+eOUuHvWj6p2TNA4OpFrBJkMzQBMxTilE5BVRWBxG9Su
	 747+EvnFVdMwg==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Jan 2026 14:37:55 +0100
Message-Id: <DFZEVBSZTGK8.2227V5O5GQS9T@kernel.org>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] gpio: omap: do not register driver in probe()
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <broonie@kernel.org>,
 <will@kernel.org>, <grygorii.strashko@ti.com>, <ssantosh@kernel.org>,
 <khilman@kernel.org>, <linusw@kernel.org>, <brgl@kernel.org>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>
References: <20260123133614.72586-1-dakr@kernel.org>
 <176950495232.13307.15142034347404555496.b4-ty@oss.qualcomm.com>
In-Reply-To: <176950495232.13307.15142034347404555496.b4-ty@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31158-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url]
X-Rspamd-Queue-Id: B4CFF9507A
X-Rspamd-Action: no action

On Tue Jan 27, 2026 at 10:09 AM CET, Bartosz Golaszewski wrote:
> Applied, thanks!
>
> [1/1] gpio: omap: do not register driver in probe()
>       commit: 3cb53b083fa665ec14c52962f50b9c1df48cf87b

I think you missed to pick up the diff in [1]. Please let me know if you wa=
nt a
fixup patch for this.

(One unrelated note, just be because I noticed by accident. Your applied pa=
tches
seem to use https://lore.kernel.org for Link: tags, while it has been agree=
d to
use https://patch.msgid.link instead [2].

I just mention it since it might be unintentional, i.e. it might be that yo=
ur
tooling does not consider it.

Personally, I use b4 and have the following in my .gitconfig:

	[b4]
		linkmask =3D https://patch.msgid.link/%s

Not sure this is still necessary in the latest version though.)

[1] https://lore.kernel.org/all/DFW0SC4QG4W8.C7BRHX02W3IK@kernel.org/
[2] https://lore.kernel.org/all/CAHk-=3Dwj5MATvT-FR8qNpXuuBGiJdjY1kRfhtzuyB=
SpTKR+=3DVtw@mail.gmail.com/

