Return-Path: <linux-gpio+bounces-16492-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2232BA42025
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 14:15:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E85B73A76B1
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 13:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C988248886;
	Mon, 24 Feb 2025 13:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A+Ogy8EU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724A423BD07
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 13:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740402892; cv=none; b=TvwgsyFT+XxY/Rwg+YoU+Q3tVwhhKfKFZuMgIdjXaO+DWQt5JHxoSBtHvF+1euiekQB/kXqX5EK6xjwI/USu3K9i47vkXDXOsKCDs92fTvp+m6v8123owe/+3wi6qzuXnyfWNbSw4Uged81Ijyr/Ap7BXnl7AUxRL76S1QRylY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740402892; c=relaxed/simple;
	bh=bLLZFvEQ2mcyD7duh47ZwGoHjIPEzHkxh/Sc0z24Kyk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ied1XWvLo2DDa5UgHF4FxEuEcalOucwHQhqKbDFJj8BvPDUFCVjpaKvAic/D7lsAvYGRKXfpAltmGAgcQlGmvWLxiLe5btplzBMNEDGShWpSe0BnHqsahlz5XOCDl3NYQQztsZdAEpmoFasXnTCC8OBy4iaNGhSoTpgEMakebxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A+Ogy8EU; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38f2b7ce2e5so2546088f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 05:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740402889; x=1741007689; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bLLZFvEQ2mcyD7duh47ZwGoHjIPEzHkxh/Sc0z24Kyk=;
        b=A+Ogy8EUQE8JKzQGGQ8yzHdOe/0MnX5du9SpvG1kacFoiGmm70s+MBXnYjNR7GojN/
         kiVDAZ93+M7Uc5FBhSfCfn55OBf7aiz33XEFm2YcMZN3lpxBF5EF8DlahS1ZiAoZoLfg
         eO0TS4s70buKHwUncBL/oTMH59bIo+x/UByxX6lkvv0Y01gtvpuUXVWcMBnGWW18unaU
         TlqnFAggM/4JTQnF4kDteIORunGNTSjv2g756BZN2cbC15QUFcDnkvPRCUx3czvRvm/o
         UJxhbvgc3s0EKj/exnfYM6T/Gb7trNl3SVeK/xLs0hHSbVkVW7ArGs124A7eeFPVvCO2
         cTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740402889; x=1741007689;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bLLZFvEQ2mcyD7duh47ZwGoHjIPEzHkxh/Sc0z24Kyk=;
        b=n2lNXB3brUHsO3YizqL+4yN98ZIONSDcLteVd5DEjW0HDeaSNACdjSvhiVzkiXwOt1
         7BHSYdeTd/3B8aQJdcMCb1xypr9hAf5RFWGX6apTub+wtN4ngeXX7fgaiajj6u7sIrVc
         NfzQwZdoWxfL3PJ1NDkXo6FW2Y5vYPptCWd+kJaAqyKffGM7HcbWKMmLvmhQ6DjC8gjH
         I21InI1RCL03aB8FLUA1eZoNf9RsaeAAefZNkMcH50jEOylBi5J+jidlSkZCvTjNr/cC
         GRa5gHnC9y7i762sB9jbRT9K0BIBUaeFjKjZQuSneUN2vEG2KhlrUBAH6JMkY981fbAq
         A/gA==
X-Forwarded-Encrypted: i=1; AJvYcCUQV1cZor7NpYgqiqRZUYn6it0/d2km89RMYFGtgwcvlEPGVFX9lkbmgbnTwch75XK/Ste+azPEEK62@vger.kernel.org
X-Gm-Message-State: AOJu0YzgN63I/WatmOOMxcr65dmq3nc7QpROvxaQdmryREOMHagiuUnJ
	l8LcbS/RlI0/ilwzIB6YgDkaFg0QBoPqvbCUerYcjy8PKkYU1+ue0fweziEL25o=
X-Gm-Gg: ASbGncvRFqzP/LfEDeP5XI0WzN5u0NS8oaXqils8wToLcprrWcv5vaAsVdzvCMbjy5j
	rwum0VDbAefivSxpimlGfHbrqL6DmAOREUpHXGtb9wHen8xa8kLEKPZTT70B4NGTuM5nDukH6gL
	DJ5R9ykU13GmAhcyWr7rxcESk6cpKfErLkJv5Xaz0TfxT3cgTOQB4F3ZHsBlllFRb6ofiP7qJka
	FiLTFjkvOmXJQmBowatQ2fNkqx1cXZTSo11OVlqmqaRfcX9tERFizdXNlQRjJCT74TOwMnZHlV0
	68Dg1qUKJAb4XDIt3KZukVzrAlN6cw==
X-Google-Smtp-Source: AGHT+IE62+bU4+ul+YKhx4/yDKxUqcbC0QHBkW4DOt4UrwyrOCzCT+b1QBYFtOue4gs6rL65DxMppQ==
X-Received: by 2002:a5d:47a3:0:b0:38e:c2de:70d4 with SMTP id ffacd0b85a97d-38f6f0959bamr11119239f8f.42.1740402888772;
        Mon, 24 Feb 2025 05:14:48 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b4158sm31190873f8f.3.2025.02.24.05.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 05:14:48 -0800 (PST)
Message-ID: <b2c8c4757d30b808e3ce800daf6078df6a7a5bcd.camel@linaro.org>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add max77759 binding
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Kees Cook	 <kees@kernel.org>, "Gustavo A.
 R. Silva" <gustavoars@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Date: Mon, 24 Feb 2025 13:14:47 +0000
In-Reply-To: <288a69e2-0618-4dce-a96d-646daeb6ca70@kernel.org>
References: <20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org>
	 <20250224-max77759-mfd-v1-1-2bff36f9d055@linaro.org>
	 <288a69e2-0618-4dce-a96d-646daeb6ca70@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-02-24 at 14:07 +0100, Krzysztof Kozlowski wrote:
> On 24/02/2025 11:28, Andr=C3=A9 Draszik wrote:
> > +=C2=A0 gpio-controller: true
> > +
> > +=C2=A0 "#gpio-cells":
> > +=C2=A0=C2=A0=C2=A0 const: 2
> > +
> > +=C2=A0 gpio:
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/gpio/maxim,max77759-gpio.yaml
>=20
> There is no such file at this moment, so this is not bisectable. What's
> more, even if you fix it, you will have dependency which you *must*
> always clearly express in patch changelog or *top* (the first people
> see) of cover letter.

Thanks Krzysztof. You're right of course.
I'll fix the dependency issues in the next version

Cheers,
Andre'


