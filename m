Return-Path: <linux-gpio+bounces-38423-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qL5aLcsjL2qm8AQAu9opvQ
	(envelope-from <linux-gpio+bounces-38423-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 23:57:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 329826825E3
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 23:57:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Ju/bKq0M";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38423-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38423-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 784C1300900B
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 21:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B9933B97D;
	Sun, 14 Jun 2026 21:57:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C5F3033D6
	for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 21:57:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781474244; cv=none; b=lRqTJl8WVAZhRUsuAvz2br2bSn7W0VMy7BEtZ653uTMnSjZhUkpSwj1FZRWJ2Xf9yZvn29ADRznFd34AjSwqgzX5OW3YaMMlhYlzwjXjIidzJt15QzwCrqk3b4WUIAHBjhM3kbHS4hSmovKLDtsiAhA8qEsLuS14WJ8jiIWEGXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781474244; c=relaxed/simple;
	bh=sGk/U72tZEkF2KYoBS0hK0weNNaNbKa7jZafhRh3xvc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DB+v00uOvqscz1rlS4ko6Bbv0HPchxel8Ssieq+Mcq4SB8V0AdW25j+JH+KC6LHzVFsV62er1tF23eR/JiV8Nfpr8+pwk3PafLIkBBQ6QDPpU2uRAJ+bB2JKM7jhvs284nPJSCmw/f1bkXL2gjiMOz2bcU/i7czHPA5rUqsyUbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ju/bKq0M; arc=none smtp.client-ip=209.85.221.176
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-59eb57ed4cbso990526e0c.0
        for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 14:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781474242; x=1782079042; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slxehqDwE4bbkZOJYryV9/GE1Y8sTVTKoHQjRDCh1JI=;
        b=Ju/bKq0MhFa19gp5dONOLYd8mG/3iCYnjUMY8795tyzVGI+KTIe9eEpQwKJnYCF2Db
         xxJkh6znSl25lMreue0JZsWuTdAz67YQyowKquBG0keX+ij7U726SV0ZhFcrqaFydJfZ
         GP3L7YsUZy6lgYJf9qsD4Hg0ne4MKl/rJvry5F//RWjTil3ewhELx6zk04zOOqYMnG9r
         hui1dKm/2CjzbfLE4/Vu7EMXBGDASFzZjYo+EujfIUl9V/2/rl+UXRawFA7Rlw8GylNd
         oOO384t7A0uoNYvXHDRm0uOS7BepVsqXXXQNflW9RQQixfsYMJQj0yHIoCtYR1Xf2qup
         x5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781474242; x=1782079042;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=slxehqDwE4bbkZOJYryV9/GE1Y8sTVTKoHQjRDCh1JI=;
        b=NFUcQQvGJ4js4Iyx6dH5xktshxe2VEYXtJHPoLeYAj6K2mECiVVT9x1RTkI1wiHIea
         sC/QnVlQ+a6yKJYdV4IuuCmb8hqCRi63KHLGfDgFKX8GbpmMVc3xY5OZsZusVw9Gblmb
         zANg1Z66EMmrj7vjKJqZDqe9TICFNBBBKqX3PMYugBTgYy7wDjLKLZBk6KkNsZpGfvRO
         oNdOSTsqBy3nKfZMV/Ryszf8hX4k7wmp5hY3pQN7bc1f2Ur2Hbu261ByQEJ+xYQ3i9fC
         ZbSiLuiXZVNj/CGdwc6hunntPty1DJrCVdaBLpx0BgzMsvrGDPlhSBii9nUi7tl9Z8KH
         0xhg==
X-Forwarded-Encrypted: i=1; AFNElJ+2CRtQyE5n52VD2vzMa/ODmlaR0sBB5y2e+oFHHht8mtngSehlqQnWMHQCMF9++AavqB8QDJC/bgAF@vger.kernel.org
X-Gm-Message-State: AOJu0Yws7T7tU/bK0fPdqQTxfKbcnIE7DeDSZAiJp9TekpMfBN8AH3tt
	AImqWda9knCmbhq9afMrffGb3XV+RUwh2zWmzV6jHihiMW/g1YQioFSf
X-Gm-Gg: Acq92OHiyeCYl69QiZRbsh7gfAHPhGa4bhPQ5Zmsg7zb0iAaRdzOrg2Q6IkWXEVNtp4
	j2v0kJkw5PY7oEPmh7IoTLtiJyHfy2QBDDPyDQ+hsOpGytashQRlcZr7Ka9hWTtTkhY+quWXuXI
	vzmR0d1x1aYEZFeCbcWuk689HHzeSp1Pb3kAytjpkf76RptEAO5EZX2C8JOAs1ZmIzJBRK6aLMw
	XmT7Ab722Jomx6oDfxhj5RlHgqGRdYXlw9y7ZC4NdWub2CZb/ydJz4LWsFRoODbVRJDaSIbD7Fm
	RDh7rZPFOcgVLzc9Sg/7XP2XL0mn0jTW15g/nOY1yq+X6vL3Oh/XDlXrJRZwroDcCo4JUF2hcAR
	qK2wAL3ZIkjxXdlJLBxzqyLfcCaMFE4t6Lt2nm98FW5eyNd86FvEyJRkYYeGNEWVT8YI0gmUE37
	HcPQuEm3E6nJAKIQ==
X-Received: by 2002:a05:6122:513:b0:575:24a9:78da with SMTP id 71dfb90a1353d-5bb6c0ec1b4mr5565063e0c.11.1781474242047;
        Sun, 14 Jun 2026 14:57:22 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb8ff961e3sm2159691e0c.3.2026.06.14.14.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 14:57:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 14 Jun 2026 16:57:13 -0500
Message-Id: <DJ93WSYC3HTT.3NXQW390CLQ82@gmail.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: iio: adc: Add TI ADS126x ADC family
From: "Kurt Borja" <kuurtb@gmail.com>
To: "David Lechner" <dlechner@baylibre.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Krzysztof Kozlowski" <krzk@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
 <20260612-ads126x-v1-1-894c788d03ed@gmail.com>
 <20260613-loyal-azure-goldfish-cf6d54@quoll>
 <DJ92JT0CPSXJ.1113K3KLSRHH4@gmail.com>
 <f13b9c55-770e-454c-9bfb-5847ff17813b@baylibre.com>
In-Reply-To: <f13b9c55-770e-454c-9bfb-5847ff17813b@baylibre.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38423-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[kuurtb@gmail.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:nuno.sa@analog.com,m:andy@kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:dlechner@baylibre.com,m:kuurtb@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,gmail.com,kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuurtb@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 329826825E3

On Sun Jun 14, 2026 at 4:37 PM -05, David Lechner wrote:
> On 6/14/26 3:53 PM, Kurt Borja wrote:
>
> ...
>
>>> Not a separate device node. Fold into the parent... or explain in
>>> commit msg. You have entire commit msg to explain odd things.
>>>
>>> In that binding description you call it "independent", so it should hav=
e
>>> its own SPI chip select? Why "independent" and part of this binding?
>>> Maybe not independent, so basically part of this device?
>>=20
>> It's independent in the sense that it is a proper subdevice on the same
>> chip. It shares the serial interface but operates completely in
>> parallel.
>>=20
>> I decided to add a subnode because other devices might request their
>> io-channels and most importantly a different voltage reference might be
>> connected to it.
>>=20
>> I'll clarify this in the commmit message on the next version. Although
>> after seeing this submitted bindings [1], I wonder if it's a better
>> approach to do something like
>>=20
>> 	spi@0 {
>> 		mydevice@0 {
>> 			...
>> 			adc@0 { ... };
>> 			adc@1 { ... };
>> 		};
>> 	};
>>=20
>> Any thoughts?
>
> I don't see how this relates to the linked patch at all. The linked
> patch looks just like a normal DAC binding.

Ah, wrong link. This is the correct one [1]. The suggestion just at the
end.

>
> What is the point of the 2nd ADC in this chip? Is it just to be able
> to do simultaneous sampling of two different measurements at the same
> time? We have other simultaneous sampling ADC chips and just model them
> as a single device.

It does simultaneous sampling of the same channel, as well as different
channels. Also the secondary ADC is only 24 bit instead of 32 bit, has a
different noise profile and has a different PGA configuration (goes up
to 128 gain, instead of 32).

Taken from the datasheet (Section 9.3.15):

	Use ADC2 to perform main channel (ADC1) cross-checking
	measurements (for example, diagnostics purposes and redundant
	channel measurements), system background measurements, or
	temperature compensation of the primary sensor (such as
	thermocouple cold junction compensation). Using data rates of
	10, 100, and 400 SPS for both ADCs, ADC2 performs virtual
	parallel conversions with ADC1 on the same input channel.

>
> Since everything can be muxed to either ADC at runtime, I don't see
> any reason the devicetree should care about it. Forcing certain pins
> to be assigned to a certain ADC seems overly restrictive.
>
> And unless you have an application that specifically needs it, I
> wouldn't bother trying to implement the 2nd ADC in the IIO driver.
> I didn't see any hints in the datasheet as to when it would actually
> make sense to use this 2nd ADC. My first thought is that it might
> make sense to use the 2nd ADC for a 2nd buffer so that you can do
> 2 buffered reads at the same time. But without knowing why this chip
> was designed this way, I don't know if that is the right idea or not.

I myself don't have an application for this feature. But I don't see why
not adding support for this feature, given that I already implemented a
driver (Patch 5) and is capable, as you said, of 2 buffered reads at the
same time.

I do believe I have to explain all this better in commit messages
though.

>
>
>> Ack to the rest of comments.
>>=20
>> [1] https://lore.kernel.org/linux-iio/20260519-ad5529r-driver-v3-1-267c0=
731aa68@analog.com/
>>=20

[1] https://lore.kernel.org/linux-iio/25mh6grzh7zh3b4uytcqnusyv5zjuf6ia4if3=
ce3oqzqz56ehi@le72iqv7ye3d/

--=20
Thanks,
 ~ Kurt

