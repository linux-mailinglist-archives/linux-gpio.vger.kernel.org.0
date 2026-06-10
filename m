Return-Path: <linux-gpio+bounces-38292-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WwOPEV3SKWqIdwMAu9opvQ
	(envelope-from <linux-gpio+bounces-38292-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 23:08:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B4766CFAC
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 23:08:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Oe/C6mRL";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38292-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38292-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9727D303897D
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 21:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3D8426698;
	Wed, 10 Jun 2026 21:08:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B7178F59
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 21:08:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781125701; cv=none; b=NOkulQ94uyCWBFBC4zJIcFCJYUoka8+0ewsK1TUrrJGPx5IGJpdm845Ho7u0VGnUBrG1sK1RXi51Cd1tsT0fw/CzoNWt10W/NCOMPv/EWFFMMAYC4XyiznSyo2xe1ugmcVAk/1pzEXNyiyk1I+Xa0rMz8Lk2lPg9M+11Ugwb90Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781125701; c=relaxed/simple;
	bh=imoPNDopSyK7pyeIJbG6TOhLV2SIPE3pYjkOcQVdFHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PxHyuJX9cL2Goj11PFXrP//deYW7McVlGFCTnP8eln+VGrvujDP5nMRX/5zJaj8NTnLUso9wlJUBpfPKg+JV87jRb7e0LhAxeCiBmGu29k+7DqsXb83idQ5O/CAGMLczkxCLcX9INfk7gxpIOL3SEIs2o8Ny5Kzf5SC255TPwhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oe/C6mRL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB2B21F00893
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 21:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781125698;
	bh=imoPNDopSyK7pyeIJbG6TOhLV2SIPE3pYjkOcQVdFHg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Oe/C6mRL3I4WPY9BD3DpbZYUiY00QHrhs32lKjvlxzz8BR5XpvZjLBHvXu/kDX1gW
	 TnNQV2nGIoR8Yc+NSZz1cRJ2ExoTM+rjkJEG/b/4/g8LT83khQrXDC8J0Eqe4Wi5+B
	 ClFD6wTKTQZurLPdEJfmshnUgmvzkZY+SMhS+7IY2kN29sxl8GhjlM5f72L7/S0jd6
	 SpLQbBmF3k701mbclj04pD337mvzV83+GjgHhhzLqLbqvVxNTqHyYv2v1X0oagKrHG
	 4zhvpALOu+aw9uvz16tUpztr/z85wu47tZnB6q7dEVAdVGfj0Bt24zTzfhnEr+Hdhi
	 J/pHNy8ocdXRQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aa68dbd44fso7530835e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 14:08:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ex542HagQGTEXSuzRCS7YgObsrEArg97BaCMkYemiCQcI65/x74UqTkRSY7IGE/FHlUI+mDoBhFfQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxipAuN5vMWKJB3d2PuE2xwU/VvMYArnOIgeWA/saWMVArCJVSY
	hidpSsgoB4eu2uVbpq70Vj/XnhBqSUpomhxozhEsQWb6H35PtBJkKj046rIp/M4rUYUx1ohCKO8
	xVBLzj/YiLikaGO3HRomL/3qvCOFvHE8=
X-Received: by 2002:a05:6512:15a4:b0:5a8:fbe1:15a3 with SMTP id
 2adb3069b0e04-5aa87bad666mr9189095e87.39.1781125697590; Wed, 10 Jun 2026
 14:08:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-gpio-kunit-swnode-hog-v1-0-37b3bf37096c@oss.qualcomm.com>
In-Reply-To: <20260610-gpio-kunit-swnode-hog-v1-0-37b3bf37096c@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 10 Jun 2026 23:08:03 +0200
X-Gmail-Original-Message-ID: <CAD++jLmrXZWBCbR0Z9uSYek=AfGoumP+aKZ6cLnebmz7Q6av1w@mail.gmail.com>
X-Gm-Features: AVVi8CcAacAJ9q52V0eS5BGUkdNoJ06zt51LGhIyXvxbv6qzfI8hfj3r9eP6xgM
Message-ID: <CAD++jLmrXZWBCbR0Z9uSYek=AfGoumP+aKZ6cLnebmz7Q6av1w@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpio: kunit: add test cases for software node hogs
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38292-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E8B4766CFAC

On Wed, Jun 10, 2026 at 3:29=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> This series adds test cases for software node based GPIO hogs and also
> contains a small code shrink in existing tests.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

The series:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

