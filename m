Return-Path: <linux-gpio+bounces-36298-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id y8gVIFhW+2mrZgMAu9opvQ
	(envelope-from <linux-gpio+bounces-36298-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 16:55:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5432E4DCB1D
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 16:55:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C59730039A5
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 14:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82A33E3165;
	Wed,  6 May 2026 14:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mgMz+dzT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97781478846;
	Wed,  6 May 2026 14:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778079312; cv=none; b=s8rSlFvWgy71w/TPX8JQKFyXgVjdJN8OOCxKQp+UC04T2n3R8WS2jsV4CzKZUzLYXxS2VtyE5ohNC23+b0paqOA2mi3xiG9jOWkfshY7XXBhIkB6+fzWMuJNMEpapQQ0FHMK7SqPqxKJvLsmZglr56riu1527HJCI15ToRqsoUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778079312; c=relaxed/simple;
	bh=OirUg954wYSr/h5FEe1S3tXyTJdn1LHFNZdK1N43jUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m2NFOuIF/mi2gbZAXYv00WeXGU3Ow4u3xfowngYRbwiqmz5tPsgOp+2IpLKEcTPHAVR2edisEJ1O9WM6TLBqJPPi1z5NUFlBoo+BQMACguV2vQ0RGcQJm+2baRlG2LtdU9j/oCsQjxApS5SH4I/bTLRtP5ccUgeKjsisK9wo/Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mgMz+dzT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF918C2BCB8;
	Wed,  6 May 2026 14:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778079312;
	bh=OirUg954wYSr/h5FEe1S3tXyTJdn1LHFNZdK1N43jUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mgMz+dzTAFmBn5/d/uxW0BUVKDXU5PeDvnlqIS1wlY148Odahe+2Ob39cAlMayPFm
	 w3tu+6+b8fXOw1Jw85QtdvnvTAACSfkGyRekcD3LTFnyxHyBJDcAUk6dEuoZrObQYi
	 wiRRTypkY00pcGkt/Km399drTXX5Pfww3N2JSn7YcWyBywYwOOw+bTAeuJbZjZE+Tx
	 +UXHi+ahbrKkM4NkxN0fC3eD4SgIzkqcGL2kuNp4EntLJ7MyePc9n+NHZuUaWghEIM
	 17hosEqP555R3x1ExvvRTWL/1znOh9XAVet3YBddCY9d2CUPk29WO+x2AcPcyxSEfB
	 /qbYOQy//xUEw==
Date: Wed, 6 May 2026 09:55:09 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, devicetree@vger.kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>, linux-sound@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 02/17] ASoC: dt-bindings: Add support for the GPIOs
 driven amplifier
Message-ID: <177807930939.2097239.10466514402590959351.robh@kernel.org>
References: <20260429074356.118420-1-herve.codina@bootlin.com>
 <20260429074356.118420-3-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429074356.118420-3-herve.codina@bootlin.com>
X-Rspamd-Queue-Id: 5432E4DCB1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,suse.com,csgroup.eu,gmail.com,perex.cz,bootlin.com];
	TAGGED_FROM(0.00)[bounces-36298-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:email]


On Wed, 29 Apr 2026 09:43:38 +0200, Herve Codina wrote:
> Some amplifiers based on analog switches and op-amps can be present in
> the audio path and can be driven by GPIOs in order to control their gain
> value, their mute and/or bypass functions.
> 
> Those components needs to be viewed as audio components in order to be
> fully integrated in the audio path.
> 
> gpio-audio-amp allows to consider these GPIO driven amplifiers as
> auxiliary audio devices.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/sound/gpio-audio-amp.yaml        | 270 ++++++++++++++++++
>  1 file changed, 270 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/gpio-audio-amp.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


