Return-Path: <linux-gpio+bounces-40060-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UjGRKIRFVmp32gAAu9opvQ
	(envelope-from <linux-gpio+bounces-40060-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 16:19:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EACA755B53
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 16:19:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rCNYjfqJ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40060-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40060-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 24FE330449A5
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 14:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2F647D94F;
	Tue, 14 Jul 2026 14:18:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9A747B42C
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 14:18:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038711; cv=none; b=BMlGrIYF6zW5sUgFr+DrN46a4vjdYIrcwsP6sQFZjmQAzx6I9eWEUw68gUZtYrl4nxHRmIPmFtGuZyKXG4twHBqQiUn8j+0l+uswGqbWJDTlQku0NLmP1cwCkoAAfreOM6q35VAU2Sf3bXtY5Y+9O2Qi72zhte/vGJiMrcsOv60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038711; c=relaxed/simple;
	bh=0DKG2To6jCVPnZRJ2L+oO8w7P5y+YqwjWTPKkHTL7CU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUgukAG7aTsyXlvhEafAG+6gABuHLkaRtf71lgIgE8O3R4gJOlucxXHyFWqMDaby2LFZV5NdGvl2OhNZR6Lil4T6/mCGlfLZPuMcgSQxgcKbqvkETrPm5gYl1dB4yf2NbM00eZGXgC3zbb/QjBCTKBXAN9ph23bYaLbDRo3Nd4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rCNYjfqJ; arc=none smtp.client-ip=209.85.218.54
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15e3141d02so510504566b.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 07:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784038708; x=1784643508; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lZB9rfFkhOTFphdLGR6TyG9TjcpFUip/IJVahTcTdLg=;
        b=rCNYjfqJEzBdbv652WV30QWwA2LgBr0pVAD1wzBiaswK7omi9pocA3wJjjcecykjC2
         IHB2Xtqi6vIH5UoMxzAmV1VQs/VWLMsqCpJ/Eh2u3f/1eIIGIFfbOkKu22BvY57YbhPY
         KL3EWDh4ZOl1Rosam/maNvWAUmYChjWAY84LonhCeltJ5qigSq+nqu0jKseqCI3TFmTo
         x6Dlhm80cUzqpq2pIwqI/o70c/oEQWawZQVH/6eBOPWjJFCwEb/s6H/+HdjHSfgr9HK5
         M338OIPwzRhuwWmGNhSzhDzVjs5s5JG2OCDAOf82nzPJd4ikbw4YKjWKEUlMh4hMyNwz
         iQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784038708; x=1784643508;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lZB9rfFkhOTFphdLGR6TyG9TjcpFUip/IJVahTcTdLg=;
        b=eQphQM5X/jr90Xi/YfrMwcVCiiPYSmsyOBcOBG0U6KnFPc/vJ58K3i03qKJPP72doK
         O0JU3DHOG4McTM8MbC369svD2ewLktHpl2DpYPgD8PdOLdfCze9XNgxfv3apVAeSTUFJ
         zglBVMuW3ifM2BMB79pw54LfOSS4t1rVA3oMDvgdaemA/zXkcB9ZJhPcl0kn9D25wXqF
         9vy3Av2rzbV5vejGxH55mRwoljvmZrLcCItpFYCe3FvHhCsjIwZQptpx+Ym4PbarxfYr
         gAewhI44OdCBsOv8nDwYn7ogTIGwzZQsQoGdHmgo0UrWmYVmT+G0Xej9d2GXJ70C5yrW
         379Q==
X-Forwarded-Encrypted: i=1; AHgh+RpBiNvfvAPjMBxYuUFdgaYHiH3o7fwCP+++idiHNLNwqADo873Ezo28mr3wW3qpo3g9L9uRQp33ADQv@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc1jQ0mo8QpvvBwo4vlSnRuUsJCtELXa5ho+OirCvOkCxu5y70
	8IsOiNsbnVlpsONi5PbRZ9L6MPBWt4Asr1w81Xw4MHRrV2y+8SFvvt5g
X-Gm-Gg: AfdE7cnEh2EDNmyFBe/ssgi/Uq5ElFaPkbL+xmU3DiA7xunqjIr7UDYjGsY1XDBA77y
	VOeSC8djnYJwGXMTNwig+tc6H4n5ewru9bkH618d/6eanslVmmgxBuC3qtjK6UFFXTOs9ZPB+Xv
	/gSrj0UUYgbIUMPppVR/dU/CHZAwdKS/DBtMhio7I/pmQS+J26weY8djd+4bWxHekE7HItVql1i
	rR8iOja3qtLd4X89lY5xorDkAuD/ebvrhjCDCDP10wAKPilU7ZIRsKL0cCgV2ShjItYCN42uNWm
	4wg4Sy5k0hIQh1rzVrgNvIYrcABFHcf5YL1gWEu1jx5kd1ncAgsy7n1at6X6abLjerSvUOROblm
	mKtU7Nwo2KwJXiM9VUMQu9P57EjuklEOR/2ZcPuEhUP9HeeXYJsE61VzFns73aIAnfeCYMOIa7t
	ioTEANRYEUz+RafrlkbJbv4yLAH0c=
X-Received: by 2002:a17:907:d58c:b0:c15:c290:ca8c with SMTP id a640c23a62f3a-c161f58f09amr573359466b.39.1784038708083;
        Tue, 14 Jul 2026 07:18:28 -0700 (PDT)
Received: from NSA-L02.ad.analog.com ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15deea5cf6sm853090966b.16.2026.07.14.07.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:18:27 -0700 (PDT)
Date: Tue, 14 Jul 2026 16:18:24 +0200
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Janani Sunil <janani.sunil@analog.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux@analog.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, jananisunil.dev@gmail.com
Subject: Re: [PATCH 3/6] iio: adc: adi-axi-adc: Add support for CRC
Message-ID: <ucrlt75xiwbv3rrc4gvgdop24u54eizhuqzf2av2qsa6ceymdp@kfkuiwuvakhl>
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
 <20260709-ad7768-driver-v1-3-44e1194fd96a@analog.com>
 <20260710014617.323acf6e@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260710014617.323acf6e@jic23-huawei>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-40060-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[nonamenuno@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:janani.sunil@analog.com,m:nuno.sa@analog.com,m:Michael.Hennerich@analog.com,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:olivier.moysan@foss.st.com,m:p.zabel@pengutronix.de,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jananisunil.dev@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:jananisunildev@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[analog.com,baylibre.com,kernel.org,foss.st.com,pengutronix.de,lwn.net,linuxfoundation.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nonamenuno@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,kfkuiwuvakhl:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3EACA755B53

On Fri, Jul 10, 2026 at 01:46:17AM +0100, Jonathan Cameron wrote:
> On Thu, 9 Jul 2026 10:50:14 +0200
> Janani Sunil <janani.sunil@analog.com> wrote:
> 
> > Add support for enabling and disabling Cyclic Redundancy Check (CRC)
> > processing in the AXI ADC backend. CRC provides data integrity verification
> > for high-speed ADC data streams, ensuring reliable data transfer between
> > the ADC frontend and backend processing systems.
> > 
> > Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> The 'other things' I found bit from Sashiko is interesting. Far as I can
> tell it is right and [devm_]mutex_init() is missing for lock
> in struct adi_axi_adc_state().  
> 

Ouch! Yes, I was also wondering about the lock comment.

> Nuno, looks like it was from:
> 7ecb8ee5c93b ("iio: adc: adi-axi-adc: support digital interface calibration")
> 
> Which indeed adds the lock with a mutex_init()

You mean without :)?

I'll send a patch fixing it!

- Nuno Sá
> 
> Jonathan
> 
> >  static const struct iio_backend_info adi_axi_adc_generic = {
> > 
> 

