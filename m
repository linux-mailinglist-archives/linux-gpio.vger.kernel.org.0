Return-Path: <linux-gpio+bounces-39593-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +WPdDxMXTWqYuwEAu9opvQ
	(envelope-from <linux-gpio+bounces-39593-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 17:11:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9329071D0D6
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 17:11:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arndb.de header.s=fm1 header.b=Gq9ljCrB;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b="V nOMufr";
	dmarc=pass (policy=none) header.from=arndb.de;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39593-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39593-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7328E30CC14F
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 14:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CFB536C0CF;
	Tue,  7 Jul 2026 14:56:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6A03161A1;
	Tue,  7 Jul 2026 14:56:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783436170; cv=none; b=J9ii+r8/G0fGBgzcvWQI/CDpgJDtrBYiJjvm3OfBmNEyg5l4W3nJZSF3XcHN7NP2i7OBkyr+380DTtuWRjt+m1BKZpYC0iqABp5Y7StT/Y6h0COGlthSAdB5Ler9kl67P/tguSV287HmX0TJiRxuvkHsxVhDz2rI8wJEl/eXkzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783436170; c=relaxed/simple;
	bh=ZOXYlp0jM4yRQtB0bkcG1hg7jnlZbj+tfWaD/aCHUlo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Ry9SyIiXscPnAwrIGjDIOz38gVHxCDREX4JZwDQsMKvvS6Vbky9FVzEJzMckRUjkvWHns3QFo1XncwRGVYW8VefSaT87vIAffcBBoUBQZkET/BxqzlLIn1g83yykaR+V1tSUhelT5uJ9IJ9baSKLioT2e4Vpg9jzWv5DTRERreY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Gq9ljCrB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VnOMufr6; arc=none smtp.client-ip=103.168.172.146
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 89ADFEC021E;
	Tue,  7 Jul 2026 10:56:08 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 07 Jul 2026 10:56:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783436168;
	 x=1783522568; bh=VRSzkiO75jHk1CVYNukpjqr9eHc0JnAAWEpWm+VODRg=; b=
	Gq9ljCrBpBKGz1vzhzn8yD/AEd4gEcbANHDqCwCQt0a122rulFDUR/gkTO6sAY8T
	TtaatWq+OnmrKa59IrgOjGgaoFjNEm1sk8nnbuOn5B2Vz+tfmkL4KbA1bTk0Kg9T
	5yYOXho8j89IyrFu8SkGnVkibOXakS5QW9Brs33Qt657oxC9PqB+LVYOSVkOFUcm
	q3cMr8Ta+35401RvPzO9E8hjE/iqhv69//cmVdJkEyQ6Srf7T7IYd1wAux+07iga
	lUfum2zxk65t3kJFnL83uh7u+n4u7YxAAP9pW4ksYnkKbEgkEfXXWX8ejXrhEiY/
	PUzbjBQ4QixpXIXaq1AflA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783436168; x=
	1783522568; bh=VRSzkiO75jHk1CVYNukpjqr9eHc0JnAAWEpWm+VODRg=; b=V
	nOMufr6TFJRtLUsMHArzIvJHvh38Acd/lCBYABn/rxUJlvnvcwr6kC73iRIIDKuC
	eFMNwtCraSuQycSbVoZVM4LfR0024rA64Onh0EGNTvCPbSNHPdlCPwYI9ybNtfpZ
	O7sEQumDIB/7nk9AS4Qg9bE5txY1XF2YcVhZNbTC86Y91grfL4rnovSmFDSbJzMB
	XMzoWM6iQhejKuXRld/bK5bxLHTrWijfonyLaSlvEef2Z37rEZryMNXr0Mhmr8ri
	ZBsCBdbV8HPQwEPyHuU5g1qYrT8EBpGUkJiomb+lIVq42gthCU/sjqJdkBHDRjPA
	a8qnWnEqM4l6IjEYxG2fQ==
X-ME-Sender: <xms:hxNNaqUibPlQj5adz_qbtt7clM4Z1cU7v_jrAVJ1fw7jCyV-zrjv3g>
    <xme:hxNNahbS1TvwT8PX3HlkdQgSwRaeal2wo1kAoABqDXfhbHGKUk5ydUJeRGpu1FdUe
    ebUAOHXK8xxumZ62EEBO8Bnl032fm2I28Vg2-wb52kBw3TDyMTOJ3kY>
X-ME-Proxy-Cause: dmFkZTGzJDFyzooW5HxT05/lmH0C2SnjFp3hXK73hgm4N4JAp8ZYGIoTCbbZKv6mSVLC6G
    H/nVzJlUCXzZfy3XIcIF3zGaEQJSCNU2j0ZIeQ+l8uRrmPScvW87lZ8+5ZkJ8WrUGhebcE
    +cflaaMiWJ4bzpWxO8W6ia8sRfJcvpamwCjK2X4i9ahdIPbl6wsVkXdz6uI7lhUtbLjejF
    az3pxue182Ql22u3qr/axy6yyLAUQ4d84yyPnvr25jF8RS8qvIJ2Bj5IYL5XJOk17mmpgU
    qutJTwdrxwLOo6bcyYK8xrROG5A3wEbUG/BFPO3r5rOkHMaaz595cXHyr195zXmrv5qKNg
    oDc6fnKp1pEcXCnf4ANiUlTaZhGdEMBe3atX0fGk+ttZlMDm79PBB7l0n0FRQ+1jjVFfcH
    Yyezh2MTIuX4yT0GVdGprLq1sPQtPrmK521ps06ZaZ9DHnnmKwyxRIBR5Rp9nFJ6YLkaa3
    jRRrv+rti/rHpXnL4jdJ38PUEsJzWaeSoIPKuPr3UpvAO8p+Gey7P+RgXzPilcRltRv6E3
    ZcXYRQLay8YLdPOBN1KwlbjzqcqK+UXqCeyJKzgK+7n2kwgSPWc7I/bawUZoS5fp97wuKb
    bfqA5cZvz8A8bDO15kOc9zqejqBWR31OoQRj/43pFihfkDl4ksqSEOoF/5Tg
X-ME-Proxy: <xmx:hxNNas071d8d51LzdckyilQ3fY5-DygAey2GGbCSti1xc_IgLR0H0Q>
    <xmx:hxNNasOY3-I6Nb5BA0DszkEsV7QXy8C-XplmUBVNWR-v9r04_-mdSw>
    <xmx:hxNNan0UCecf-2X6lg4ZS7Eo7FnMtcyGA5rdu-rCewmdnlnpCphqTg>
    <xmx:hxNNar1PzgMQ-maUB3D_EeRtFWYtinDdLLd9FEeS8cE0vbGmiF-F0A>
    <xmx:iBNNarnYVpU_-wsqBXc7O3HJJ5b487skRjyjf6UNI8gnNg-5QCkdIEba>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CBD8F182007E; Tue,  7 Jul 2026 10:56:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AUKPAdC25nmJ
Date: Tue, 07 Jul 2026 16:55:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>, "Lee Jones" <lee@kernel.org>,
 "Pavel Machek" <pavel@kernel.org>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org
Message-Id: <6dd3e87f-44a4-4740-a81a-c4e459e3921e@app.fastmail.com>
In-Reply-To: <akxjQtCTcx2TOQMk@google.com>
References: <20260629130329.1291953-1-arnd@kernel.org>
 <akxjQtCTcx2TOQMk@google.com>
Subject: Re: [PATCH v5 0/6] gpiolib: fence off legacy interfaces
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER(0.00)[arnd@arndb.de,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:arnd@kernel.org,m:linux-gpio@vger.kernel.org,m:glaubitz@physik.fu-berlin.de,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linusw@kernel.org,m:brgl@kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:linux-sh@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39593-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,arndb.de:from_mime,arndb.de:dkim,app.fastmail.com:mid,messagingengine.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9329071D0D6

On Tue, Jul 7, 2026, at 04:25, Dmitry Torokhov wrote:
> On Mon, Jun 29, 2026 at 03:03:23PM +0200, Arnd Bergmann wrote:
>> 
>> I hope that all that remains now can just get merged through the
>> gpio tree. The gpio-keys patch needs a bit coordination with
>> another patch addressing the same issue that is already in
>> flight, so I expect that I'll rebase my series once more when
>> that is in a stable branch, but the state I have here should
>> just work as-is on top of v7.2-rc1.
>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input

Thanks

> Could this be done as an immutable branch?

Probably, yes. How about I send v6 now, with the two input
patches moved to the front of the series? Then all six of my
patches can go into the gpio tree, while Lee merges the bottom
two into the mfd tree as an immutable branch to resolve the
conflict with your rohm patches.

      Arnd

