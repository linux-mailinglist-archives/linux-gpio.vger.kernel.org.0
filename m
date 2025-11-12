Return-Path: <linux-gpio+bounces-28411-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CE209C53C8B
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 18:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DD6D3541E31
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 17:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C9C2F5463;
	Wed, 12 Nov 2025 17:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S9TrqFbN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26715343204
	for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 17:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762968068; cv=none; b=EBovDt9S8tpyKSwqO6PksiMAOiBFwHIPyN0chpI4L1YdQmEe9BpTuTun67Gl3G1MsMs2ysV4RG/XORgzZqzhs66rRxcK33sb0IFYAyTj7JfVYuGJ/xRZDVCJJ59DIo9v6dz3EfYVjfMAnEWa2USYHmiGPk1lvTx5Nh/EQh6rF5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762968068; c=relaxed/simple;
	bh=zGm3bjPIXNlAXsn923/poaK7/h5DdSgopChHq1KIJug=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=dM1Qk79tE+XUrO/gBiG/UNd6CaL1xTO8f0at7TzrG1jyDyPCwpjk0EFxgBs1NQgCkocxSogRpotyS/II3Io6ZwhRSLGwjoWwcWuQ3hX8MMkvpeoheOUcf6XPL9Owa6FrJSrOZscTf8FIsvOvG9ej035p03tQ8j6i25/ehxRpIPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S9TrqFbN; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b3c965df5so753740f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 09:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762968064; x=1763572864; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+D8BoUvcqK/7rHl2L0r4XdY6giRmTPN9ngtKeR3ez90=;
        b=S9TrqFbNcrP3YS5Uc7rdz6PzAL3g54MeF9cHf4b6VqPeDafcgVsOwmw3sVcAxW+SYf
         +kYZ8G5A1zVPRayt8sMogwJOaPtvzFRjp83uHjY4bmuhyPP/ULvORLZSyu5rRukDMrAv
         oe4Mtob5tFI/QAhL8K4A08M6tRgspAZr9rFNkqKY1CuEyuwiRzlmha0ipW1jef88mufh
         HtUdnYZGD29e3ULyHYB1AJmA5sxwYg3TX4ME9YuPK0B3SXLXHMIOCCKL0iDeU7NUoyZc
         6RXESpaWDJd3iV94l7X2grwZG3XtoyE+63VFil56xuS/4XFFO9EM+x/SF0Bk/4MevcWB
         Rh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762968064; x=1763572864;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+D8BoUvcqK/7rHl2L0r4XdY6giRmTPN9ngtKeR3ez90=;
        b=oYKkNU2AQKfz7/mrTYfdJwUy7o0+NXQeaTMWUyAAVMefOl5YM/nrE/BlYYa8BooqHB
         gIY5DYua711kqkwXn7DSir4pIeCr+K3gLYob9UMvPlF60j6oPU1IWqkFkG77xB0+SKuv
         QvfukJQEIjiPDvYi2Xvf1FAtpOJqaj+aq1Um2iPTNwRT7aUM+o9cJtsMNPjhs10nu/Pr
         OOpuVb+Ec1Hm7OVhSUSPMzOiQeI8C4+CTwL+BljT8l+GiIfguYEWusUEEX3UTteyuSyL
         Bd8ZdcP9PkqpSLFOFuIzQdBH8I0WosuizL+tqdwiAw6wm2Y4jsBgCBzgLdDCSyl4Q6uI
         IYwA==
X-Forwarded-Encrypted: i=1; AJvYcCUF/M3ZxYdOA/w8jqAvrhLVablnU42DmOAuDyavFYizecDyjQUv2AOVQlyUNggqRDiE7U64qFk63cy5@vger.kernel.org
X-Gm-Message-State: AOJu0YyQld/7jxYc+gBkViDsyVwcvnH7OXWJhDeh+ZR1L3aaajjZ8Nr4
	rr5S9OlJCNlTlteDktfb150EtPKPRkIMvXUXrBoWZ4NSK4B+DklKZPPn5JUykM3Jk7k=
X-Gm-Gg: ASbGnctRlaDpRCx9crdXaop7EONkj5K9rhFkYg8ZFNcCPbQB5FdbqGIVhkNltkECn9c
	2d8Sz0Iy8WHE/0YFDgIUfD35JtFVKoaxl+f7SNsQvEIt95xVJU6LxA1iLhZ1Rw3fP0rHaUKLYb9
	Ak1+FrQfufOoLuQlgf06fppRbTzlHeRQyKVi0kJDS9LVSdeYBfUkvBrANx3zo6c1NkLOlP320dG
	ZxfHHWZITMUBSIg/r5N8XT2K2iXN6MznLhBpkBpL9MH+YuqHaRlE9lTdje2Jyaj2yXfhQdVgcIv
	sUmymH1g1IXKsqxj512DzKYe7fG0yIgGMvPBZPnRf0IlZuSMpbevSTWXnwAlxLDVO1LdiQQSB8Z
	JYTsvnpKBeDNxsPbeh9ryFN3O+gkdfIj/v4N/kwdi2D97bhDOtyJSHl+H3u3nSyANuCyBG4WRLe
	sxAPuKXv0J1IXen5o=
X-Google-Smtp-Source: AGHT+IFOnruwkehrKtiSlIIluNpW1jCcNK6zjknkUp1TXGQBb3IO3OG62+bnEz116c3kPlLyvXv7bg==
X-Received: by 2002:a5d:5f53:0:b0:3ec:ea73:a91e with SMTP id ffacd0b85a97d-42b4bb90b60mr3558763f8f.12.1762968064363;
        Wed, 12 Nov 2025 09:21:04 -0800 (PST)
Received: from localhost ([2a02:c7c:7259:a00:4fbd:5c9b:d8a2:ee64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b4789896esm9558995f8f.38.2025.11.12.09.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 09:21:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Nov 2025 17:21:03 +0000
Message-Id: <DE6W0RIF2Y26.1MENYDV2RIAIP@linaro.org>
Subject: Re: [PATCH v3 05/12] ASoC: codecs: wsa881x: split into common and
 soundwire drivers
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>, "Srinivas
 Kandagatla" <srini@kernel.org>
Cc: "Mark Brown" <broonie@kernel.org>, <linux-sound@vger.kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-5-9eeb08cab9dc@linaro.org>
 <f1337654-ff69-4489-840a-a1b38efb7f74@oss.qualcomm.com>
In-Reply-To: <f1337654-ff69-4489-840a-a1b38efb7f74@oss.qualcomm.com>

On Thu May 29, 2025 at 11:05 AM BST, Srinivas Kandagatla wrote:
>
>
> On 5/22/25 6:40 PM, Alexey Klimov wrote:
>> This is required in order to introduce wsa881x driver that works
>> in analog mode and is configurable via i2c only.
>> Functional changes, if any, are kept to be minimal and common
>> parts or parts that can be shared are moved into wsa881x-common
>> helper driver.
>> The regmap config structure now contains 0x3000 offset as required
>> by soundwire spec.
>>=20
>> While at this, also fix the typo in WSA881X_ADC_EN_SEL_IBIAS
>> register name and rename wsa881x_set_sdw_stream() to
>> wsa881x_set_stream() and update registers description in the
>> header and use the new defines in wsa881x_init_common() and
>> in wsa881x_digital_mute().
>>=20
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Cc: Srinivas Kandagatla <srini@kernel.org>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  sound/soc/codecs/Kconfig          |   4 +
>>  sound/soc/codecs/Makefile         |   2 +
>>  sound/soc/codecs/wsa881x-common.c | 193 +++++++++++++++
>>  sound/soc/codecs/wsa881x-common.h | 458 +++++++++++++++++++++++++++++++=
++++
>>  sound/soc/codecs/wsa881x.c        | 493 +------------------------------=
-------
>
> How about we have something like wsa881x.c wsa881x-sdw.c wsa881x-i2c.c ?

I am totaly open to suggestions. Splitting to wsa881x-{sdw,i2c}.c sounds
good to me.
I kept the original name to keep the changes minimal.



[...] (the rest of the patch was quoted and sent but I didn't find any
comments there, please let me know if I missed something there)

Best regards,
Alexey


