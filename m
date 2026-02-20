Return-Path: <linux-gpio+bounces-31926-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UktYNBmpl2mJ4wIAu9opvQ
	(envelope-from <linux-gpio+bounces-31926-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 01:21:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A15E163D1A
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 01:21:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E701301224C
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 00:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237CE1A254E;
	Fri, 20 Feb 2026 00:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PHjshoBP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70F318A93F;
	Fri, 20 Feb 2026 00:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771546900; cv=none; b=CbrlEETaB+sYg1ULRt2mvkZjm0kGA+79+gQ9YZ0iuCodkJwG6YLpGK9VkpLwYTMBJIJk/nfFHcxUcjvnjitMksbAAPYfil9MDtT+xC+BOovZsuivRwq/qXpwHOqXei+YKpf4I3DBFkyDQHvrb7xwfMcxrLhBQKpInCRzTs+ELC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771546900; c=relaxed/simple;
	bh=gBGAYqmfKLV8fmNcIwtly5K6z+qNeu5bHwbJwmhL+Jg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=noFjHo3F4KVlfZmstXCMhteMSVq1n/xpkNcC1ti6HrLiFvZ/gQLbRD5R7LayUHLlDaWrKjWbmtTVlhG2nTm93cankJzkPwpYM8/snIW4jVE8YPhtmOHObNWPqYdnaxqElkv9pUk84ETLHv3kqh6OXE+2UIXpXCoPWjukRwgea74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PHjshoBP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88302C4CEF7;
	Fri, 20 Feb 2026 00:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771546900;
	bh=gBGAYqmfKLV8fmNcIwtly5K6z+qNeu5bHwbJwmhL+Jg=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=PHjshoBPCWUWrNrwmOmSBepWNFIUqg0lcLK+RMsLYoP7MH/ZRyxrLqblcfSgXH7o6
	 5rnEPqU6Qt6QiBVtk3bQFtDMXfQC0A4EqXrJW4U7sh9RHOBqrc7IwLk90Zmrpefv3g
	 QOnlb9AYVhpmUNnJX4SgN9u3GBs0kC16WFw/plQG1q6uhfDsgGAGlrmjlvxnj/ifqG
	 XY3Nh7UGRPm5I7vKm2RSUjBItbVkWBlJq909a2npgkXxI6AtrHiTyCWN7smTcZZA4r
	 RLVhBODN52n7aHaR9lG4dp3svWdTPiV22CAqQTe+xjbUXQvN/GxI31VnoGAIMCrvrJ
	 ZdKOi/x8reAMw==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 01:21:36 +0100
Message-Id: <DGJCYP64Z668.255JPWWORBZTT@kernel.org>
Cc: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@oss.qualcomm.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Linus Walleij" <linusw@kernel.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
To: "Bartosz Golaszewski" <brgl@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com> <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com> <2026021900-trekker-twenty-9daa@gregkh> <CAMRc=MekX-pXJEs7W9vn8-exAXyfNN3JMwrVNDPXg0b77X1NNw@mail.gmail.com> <DGJ3H078RVW8.28AJL6FR3OKOO@kernel.org> <aZdkN2zje5CEaar_@smile.fi.intel.com> <CAMRc=MfcrD8NNh+8WaO_3BYG8Eqoi5wz__s7AeCR=rt1NkWrkA@mail.gmail.com>
In-Reply-To: <CAMRc=MfcrD8NNh+8WaO_3BYG8Eqoi5wz__s7AeCR=rt1NkWrkA@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31926-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,linuxfoundation.org,oss.qualcomm.com,kernel.org,gmail.com,lists.linux.dev,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3A15E163D1A
X-Rspamd-Action: no action

On Thu Feb 19, 2026 at 10:18 PM CET, Bartosz Golaszewski wrote:
> On Thu, 19 Feb 2026 20:27:51 +0100, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
>> On Thu, Feb 19, 2026 at 05:55:20PM +0100, Danilo Krummrich wrote:
>>> On Thu Feb 19, 2026 at 5:39 PM CET, Bartosz Golaszewski wrote:
>>
>> ...
>>
>>> Also, is there a reason why we need both device_match_fwnode() *and*
>>> device_match_fwnode_ext()?
>>
>> Yes. We don't want (at least for now) to dive into bug hunting in a 2+ y=
ears
>> horizon if something goes wrong with [currently] working drivers that us=
e
>> device_match_fwnode() against the cases when there are primary and secon=
dary
>> fwnodes present.
>>
>> I won't put my bet that extending device_match_fwnode() won't break anyt=
hing.
>> And I don't want to invest (waste?) my time to learn each of the existin=
g cases.
>>
>> The proposed way is robust and safest. And for the record, I will be the=
 first
>> person to push back device_match_fwnode() upgrade without a comprehensiv=
e testing
>> on real (affected) HW.
>>
>
> Who's got the final word here? I responded to Danilo's email saying I can=
 fold
> the new code into the existing function but you are against it.

I asked this question because it does not seem unlikely it could just work =
for
all drivers. (Reading other threads, it seems like I'm not the only one ask=
ing
this.)

If someone is up to investigate, why not? If not, that's fine too, then we =
take
the safe path.

In case of the latter, I suggest to rename it to device_match_fwnode_full()=
.

Thanks,
Danilo

