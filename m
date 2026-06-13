Return-Path: <linux-gpio+bounces-38397-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EW5cIjagLGr4TwQAu9opvQ
	(envelope-from <linux-gpio+bounces-38397-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 02:11:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AEB67D316
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 02:11:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OW3k9+kn;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38397-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38397-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B944322B1CC
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 00:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3A32C181;
	Sat, 13 Jun 2026 00:06:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480B226AC3
	for <linux-gpio@vger.kernel.org>; Sat, 13 Jun 2026 00:06:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781309186; cv=none; b=unPj6/bQO4W81zHmLo1RaghaOI1bG6upfaQq5hYZhbpeV3NXkazDuRT0J9gVAMnfWDhiGPKZpWuMb6z2mzttmY+6dqM1omHXNdyTfnco8S0aOD0hY2A343JMRSj/Ia/2JAPkrzRuZNA0zMfF1XYSIikrCnZVnGr0VGa5SY7Acgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781309186; c=relaxed/simple;
	bh=6k16D58X5Hp71dTQ2A4hs7CDJxnziA+HOcbHy3F7wYg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Esy0kJTQNaWqX49iALUqkCVYM1pRxf1zj1oPeoj6jGzPmTXduczt9EjTC3MH+pMCfG52cyjXa+ZkxohSwj6CR8AQ9pBMZrANAIdBPxvvIVhbhkA/+vyAfwWFMF6AObyK5wI/3rBv3lqgM34bUNvq+eGCsYGFZOm/Z7dD7Pi8u30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OW3k9+kn; arc=none smtp.client-ip=209.85.221.169
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-59d7db12342so464593e0c.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 17:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781309184; x=1781913984; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8p1+OVmvemJz2aH/soukQnCPpp6FHT4E6Hl1lAMDXE=;
        b=OW3k9+knR2VedobA1/HIDXu1GO//1Xh1WTGPDqubRSdx0XLDCGjapDzJSqgduyXFSR
         LqmXV3KEnimT17WyfZZX7R9n+SnTI8QowmiYBeiYv4ak9wrlbBKkUmZWfoH6rkQDRnZZ
         DSq7eLbQHcUvxAhXv3JiiQ26sg/EliQtk7ZXopSwuS3hCyoBxHx1cveaUgYCjFI+/bo6
         +HhjVRMvdg+MX4/Iv+uk3ujLVWcD70mfbaa2VTlwnTqAQAav7Psr6TiCTkuEIr6Ai0ED
         IsSlEr8Uw9XNpjZk4ya/IGbOZvxTsyVQQhVlm2QWFCAKFB3vBldEwK2Oi1No3LYHtnyQ
         lugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781309184; x=1781913984;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V8p1+OVmvemJz2aH/soukQnCPpp6FHT4E6Hl1lAMDXE=;
        b=lHhfWPAfZbytDrR/QIFK5RT1mAJZM/yz6A7R3Mu5T8qZjUiJXc5o0flX8r6y34vS4w
         9fIk7VRHOfg4CwSI+tkzeOByu0RHF9A5JMvcrLlgE6lKPB2Ncm5RC5vMTa9FwkGA7ZJA
         bSd8NjuywQTRVQGzPiXlkEmG5PG1WwC1l5R+/ib/Ub69OiKy/SqVk+wOaM4pMa08nFnt
         booMEuv5WdlUrciR7aQYVdCz6ska1bQL0DhFl6QGRI0/OljhYExwwrGTnecVP5xcTkMY
         SFafY62jGyXAP9asmUiOMojS0gfnWtEn1eRyNtDvjE88wEKarWs4T7xeLNHCzPzsfokb
         0JQQ==
X-Forwarded-Encrypted: i=1; AFNElJ80iqk5kVgC5JZ4b9SSp6sOVyPcmzz+TZMZ5bETIbNBg+IotyGCYIz7T3Aw1khnuAPpOsPNgReZ0x24@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1CVuon8BbqNtXSFrOENLibYeqJLPS7yVBRwv2EomcLTdzUK2k
	8+abbJ8bty3pcA0kNFsYhTCUo0w895jpR4scP8tHtLkxwASoaeXES7oC
X-Gm-Gg: Acq92OFamd81setTsSeQ+xB5Wcq5ZaTEAf42BPjaG3+ku7YKJnhwQjZikhlA1XURdCE
	yKyF4wJt+uVNqZABLPKHf+PCtRWtwkBR206VPXYW7yxLU6cZrR0mD5gskVx6B7dmSdg2bMQtu1Q
	/VnjHF0uGybGWYabLnvTvNG1otSnHvcrgIqXfJXlVkfIEtWdYWiQZQAp/MXea9SQxzONxZV/3E+
	jDlu2t33sQL2RcYDUDezSdR8QPIi7QLIT9XfQoNnuuF2GjJaYjfrWhBmEbmeqAxrkRCteTF8UMr
	2IZ3p3EKfCWWgBzWT/4+Zox55xi83fExa37rsiX5eKD327u4ddm1tHLVYrmll4Q1Lscn70NkUcL
	u5Y/bW9msDm+R7OcbQn1j842c/Vtl08zNUocftZVP/leIdOWsFQZDsMjWQPO66xspLnW68nVigY
	AR8tUu/3gIOpRmSw==
X-Received: by 2002:a05:6122:7d4:b0:56a:fff5:b4d6 with SMTP id 71dfb90a1353d-5bb79a93ec5mr1419591e0c.4.1781309184166;
        Fri, 12 Jun 2026 17:06:24 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb691bb8a4sm4328705e0c.10.2026.06.12.17.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 17:06:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 19:06:16 -0500
Message-Id: <DJ7HEIO6NRT4.2C1XVYIG81J4D@gmail.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 0/5] iio: adc: Add TI ADS126X ADC family support
From: "Kurt Borja" <kuurtb@gmail.com>
To: "David Lechner" <dlechner@baylibre.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
 <95291df3-c34b-40a4-ba73-813ccd4b9ef8@baylibre.com>
In-Reply-To: <95291df3-c34b-40a4-ba73-813ccd4b9ef8@baylibre.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38397-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nuno.sa@analog.com,m:andy@kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:dlechner@baylibre.com,m:kuurtb@gmail.com,m:jic23@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kuurtb@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[baylibre.com,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuurtb@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0AEB67D316

On Fri Jun 12, 2026 at 6:50 PM -05, David Lechner wrote:
> On 6/12/26 5:46 PM, Kurt Borja wrote:
>> Hi all,
>>=20
>> This series introduces support for TI ADS1262 and ADS1263 ADCs [1].
>> These devices are very similar (if not the same), except ADS1263
>> includes a secondary auxiliary ADC.
>>=20
>> The main ADC has quite a few features supported the main driver
>> (ti-ads1262), including:
>>=20
>>   - Power management
>>   - IIO direct and buffer modes
>>   - Channel hot-reloading
>>   - Internal or external oscillator
>>   - Internal or external voltage reference
>>   - Filter configuration
>>   - Sensor bias configuration
>>   - IDAC configuration
>>   - Level-shift voltage configuration
>>   - Manual calibration support
>>   - GPIO controller capabilities
>>=20
>> I plan to add these features to the main driver soon:
>>=20
>>   - SPI offload support (38400 SPS turns out to be too high for some
>>     systems)
>>   - User triggered, automatic calibration (Datasheet 9.4.9)
>>=20
>> Additionally, full support for the (less capable) auxiliary ADC is
>> introduced by the auxiliary ti-ads1263-adc2 driver included in this
>> series.
>>=20
>> The auxiliary ADC operates almost completely independent of the main
>> ADC. The only consideration that has to be taken for interoperability is
>> when reading conversion data in direct mode (Datasheet 9.4.7.1), which
>> happens only in buffer mode, when multiple channels are enabled.
>>=20
>> When reading data in direct mode, all SPI activity is forbidden between
>> the data-ready signal and the data retrieval. To achieve this a second
>> mutex called xfer_lock was introduced to block SPI activity on the
>> device.
>>=20
>> This is one of the biggest drivers I've developed, so I hope the code
>> and the comments are self-explainatory. If not, please let me know so I
>> can clarify them.
>>=20
>> As always, thanks for your reviews and help. Submitting upstream is
>> always a great learning experience :)
>>=20
>> [1] https://www.ti.com/lit/ds/symlink/ads1263.pdf
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>> Kurt Borja (5):
>>       dt-bindings: iio: adc: Add TI ADS126x ADC family
>>       iio: adc: Add ti-ads1262 driver
>>       iio: adc: ti-ads1262: Add GPIO controller support
>>       iio: adc: ti-ads1262: Add calibration support
>>       iio: adc: Add ti-ads1263-adc2 driver
>>=20
>>  .../devicetree/bindings/iio/adc/ti,ads1262.yaml    |  308 +++
>>  .../bindings/iio/adc/ti,ads1263-adc2.yaml          |   49 +
>>  MAINTAINERS                                        |   10 +
>>  drivers/iio/adc/Kconfig                            |   26 +
>>  drivers/iio/adc/Makefile                           |    2 +
>>  drivers/iio/adc/ti-ads1262.c                       | 2180 +++++++++++++=
+++++++
>>  drivers/iio/adc/ti-ads1262.h                       |   39 +
>>  drivers/iio/adc/ti-ads1263-adc2.c                  |  470 +++++
>>  8 files changed, 3084 insertions(+)
>> ---
>> base-commit: ae696dfa47c30016cd429b9db5e70b259b8f509e
>> change-id: 20251129-ads126x-fb6107505cae
>>=20
>
> Hi Kurt,
>
> I'm currently working on the TI ADS112C14 family of chips which
> are functionally very similar (although have a bit of a different
> register map).
>
> I have some different ideas for the devicetree bindings that I
> think will make it a bit more flexible. Given how similar the
> chips are, I think we will want to align on how we do these (and
> there was one more similar, and thankfully much simpler, TI ADC
> driver submitted this week too!).
>
> So rather that looking at your stuff too closely yet, I will send
> what I have next week and we can compare notes then.

Hi David,

Of course!

Devicetree bindings were a bit of a pain for me. I definitely want to
check your approach, specially on the IDAC stuff. The ADS1262 has many
pin configurations. I even considered a pinctrl driver for it, which
would have taken care of IDAC, biases, etc.

I plan to work on sashiko's feedback this weekend and submit next week.
Won't make huge changes, just fix some rookie mistakes... :/

--=20
Thanks,
 ~ Kurt

