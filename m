Return-Path: <linux-gpio+bounces-31401-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJ4TD8QngmnPPgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31401-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 17:52:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEF7DC4DD
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 17:52:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A439E313E170
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 16:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC653D3499;
	Tue,  3 Feb 2026 16:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NkmW12+c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29A03939BF;
	Tue,  3 Feb 2026 16:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770137311; cv=none; b=UZUULJJuWBWdV1sycMYpgXl6sGUyBVtDZ01mCxggEdBxTvFUFby0meGxJebyX5otuvky6sEgtf/UIirKYzM4KHGkDe/EdRc8R15k0Ozv7s2HkEWn6fK9uCPyk1mWJz24x4DELNOeHNXz2z6rNHerpATSH9wOhYbvwUm7mF8uOl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770137311; c=relaxed/simple;
	bh=KakHACAJOamzvlMphs5aYtcbPGFKUBAEWIwaHU3woqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqaCrPnpwjRLoaAyWDAnotwNr7+biVGr2iugW3kLOaP6RE+/qJ003JB3vCPMKI8g+NdLUBSFIYIEJPqeETgCrSDbIKlQ5/JnfLBUVcH9QqaxkVrO9wZXxfboKWMxKu1HbkbEPgnGLfCEN4+43oG3ZC11xNyAVjQyin3/uspYZGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NkmW12+c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46395C116D0;
	Tue,  3 Feb 2026 16:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770137310;
	bh=KakHACAJOamzvlMphs5aYtcbPGFKUBAEWIwaHU3woqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NkmW12+cSh/g1Xt7XdI9jTa211pAIttApXEXhaGbyGoIl+VkhFcreLlZvtRlhki7g
	 MtRcZlHL+pPaFKmhbuDvdV69D0P4RKoz+aev1zq5jbTVVZevQAVjySmenJVPhcluEw
	 TnWE6WflN4GA2H8CLH5YNizfHnde0KnPBmpJOmlw0sADabKAXt8Rl5SGrZWGmqIA/K
	 O17+Pa/AQkaFs0QNCtHfMoizf1sTquM+k/QCYYFWZ6PQvQNKeaYqz3cArkhF4y0PBf
	 6PZTUeEyZPdPRd1wDLhu8X9j3tXRs8/EMyMPYTpMRJ05XsOwuhg9nnIWPbqpI7tF9s
	 msXrqhEQWKyag==
Date: Tue, 3 Feb 2026 16:48:23 +0000
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Juan Yescas <jyescas@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v7 00/20] Samsung S2MPG10 regulator and S2MPG11
 PMIC drivers
Message-ID: <20260203164823.GB7629@google.com>
References: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
 <176909970862.4046298.23888884171864307.b4-ty@kernel.org>
 <0b4c5e699ce1d8211314a2bb28d7b6566e577037.camel@linaro.org>
 <1333e1d0-c4f2-4823-834c-df8f6a196d10@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1333e1d0-c4f2-4823-834c-df8f6a196d10@sirena.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31401-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c0a:e001:db::12fc:5321:from];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,bgdev.pl,google.com,android.com,vger.kernel.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[10.30.226.201:received,100.90.174.1:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_TWELVE(0.00)[21];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7CEF7DC4DD
X-Rspamd-Action: no action

On Fri, 23 Jan 2026, Mark Brown wrote:

> On Fri, Jan 23, 2026 at 09:39:00AM +0000, André Draszik wrote:
> 
> > Thanks for queuing these, but FYI, I think leaving out patches 1 to 3 will
> > give validation errors.
> 
> > As mentioned in cover letter, the patches must be applied in order, for
> > bindings particularly the mfd-binding patches depend on the regulator-
> > binding updates, specifically patches 4 and 5 reference files added in
> > patches 2 and 3 respectively.
> 
> So long as everything lands in the final release it'll be fine, people
> aren't bisecting DT binding validation in the way that they do runtime
> issues.

This!

-- 
Lee Jones [李琼斯]

