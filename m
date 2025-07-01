Return-Path: <linux-gpio+bounces-22476-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01475AEF64D
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 13:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 343F73B2CF5
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 11:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598E225B1D8;
	Tue,  1 Jul 2025 11:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pGSISDTp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD521E7660
	for <linux-gpio@vger.kernel.org>; Tue,  1 Jul 2025 11:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751368566; cv=none; b=Ggkud3+MN8BOG6XRXeE7zJO2sp2h/QHfTpAq2RSKHoz+u9j4BjEJdYhm1Z2weNWARO21EL6PewCtrkvA3uqa69uv0tmRZv38Y82xLfjpfiFJc/22WMlKraYcHhapWnsAMQlyeQQneBlK6OQv57nbfx4SQ4BFkRTs1HpfGH0oT1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751368566; c=relaxed/simple;
	bh=i36wl72I8h4JMfgZOBJ68a1dHn+hzw0MPDJsAPvxgrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hRwEEYSfvhmtLpVriVZ9+fOItuEMdHf+6C1FlUljtUGlz4BtI5PmhHYOPCsMgKnO2yXH11VfjRo5tz9vyXuUTuM6iZywFRA6Hi1csrLSSNn6+aC1XlVtv/vW8yQoLEKJgsP2oNR0zB1F9SdYqNKEOY0btRM4mANPzlyLcxlfOq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pGSISDTp; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45368313a7bso693295e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 01 Jul 2025 04:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751368563; x=1751973363; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8YheIDYDgRF75FLnq6AfXjr3+ZkQa4awLXMZTUL+DS4=;
        b=pGSISDTpU9I/6xKgfr6AxHXdgJkCyqZikASUcAXUsC6udYaMkIKm1RgUoJ17LlEFeN
         thB3sj9ZDMX5wsEHFxnRsD8zbkR9WEAc7C2MNuwXGO9bVXaQlne8jDhMOEZFCPmGtBVT
         JVHK3DwYjOa6o9wm2f25/MlZsdiYuWrcZHOY1i869p7aNQav/UcqnlL4ueS/0yssUatg
         szd+K7QkaOpJ7YwR0a8PJIs+UGvDnBlgUV8h/4wdc6Frcs3af8ySp1jfGARh1fjhhA/5
         ML1bhjGFY4o2Y57NoxtygaOlfMJq0Z/nmJY9p6GI1wSrcYpQpeJnl6otLbGsbg2sRRzR
         +M0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751368563; x=1751973363;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8YheIDYDgRF75FLnq6AfXjr3+ZkQa4awLXMZTUL+DS4=;
        b=JYvPqdkWadS2HqEK8EF/ELHkR3ifC3j9+xyya94Fi1yuITV5XXik66vNCT93/EbFRy
         NM+1cNLA64uRQa7fjAolO8dcAeC6ciTscArH68PNYDv2s1dWEUciOZruqT9nv1ZZCz4w
         31ihPg7zsU6yhh+/MN3z6dhAkiokqxNKemITAVOTDsLy0hnQjVo8Gb0zCoLurPLkd1gu
         +IX3xBEJ+ERp+Bzb0xE9uEDXmHxk8d1TVcoFVjmswPoxQDo1F4KQwYivMH2wcccZl2/g
         71Hn98SHLEMj4ED0eweJSU+GXkfUseuU/M9vojoJSJPWSaMLm9084N9hix+uWE35KgVp
         sHFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqSXetDwBgVqXdRl0I2QKLyJNPhTUNG0pI810JMv/jbwajWasn4+p5hdLrk6Qj0+lUOiAsGMWbYe3Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd9cvYc6JEP355tL8lW8C0U8OHHdqz8+rRAzffxNdM/H7r9waR
	fo3De1LdaC/n6TBQubdY3q0h9AE2jlKqXaFIrt77ouLiclEkj0ICcFHirOur4+UjYfY=
X-Gm-Gg: ASbGncuhPuuYUq5Tsrr3mns5U5ZHxZgWVEyC7LP0M6hxbHhBwnOxXaW5SqwVx789OWd
	jkbcMVDrzfv2nspo2574LklPr0SYy+LhZBC/65V6XeDyPfumxftmjWarzqOR0vbs6t5hQu/GDG8
	cXCNSyW6jCwIirqnC8Ylm9rIWRPzTKNa+/EMxdMJkdhLo9XOToy/FgKkrZL7rweVDMsZyGM710+
	khA37FjVsIFLSfvnKjhgIUZP2LXQqihS9HCoMJBnTEuTOXBCZnM9XJbbt8s5xMnoz1fGMyW8k1I
	u3/9hrafaXDTRHqao3gITByE34isxiBJMsmVEd5RBm5UCoOUO38KwpnrjczZvdQfYjeZXdsOe8g
	PZfgE
X-Google-Smtp-Source: AGHT+IFgsFny/t0Olj4Df4dRQmeqRNpZbpzthYTN88m7PxvMs3qitU24sXOFbKjFt0hCtRSn3xircA==
X-Received: by 2002:a05:600c:1c1f:b0:451:df07:f41e with SMTP id 5b1f17b1804b1-453a8549902mr9107255e9.1.1751368562430;
        Tue, 01 Jul 2025 04:16:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c3a96sm192592015e9.35.2025.07.01.04.16.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 04:16:01 -0700 (PDT)
Message-ID: <8061f061-03a1-4526-b910-fd0a50b84543@linaro.org>
Date: Tue, 1 Jul 2025 13:15:59 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/20] mfd: adp5585: support keymap events and drop
 legacy Input driver
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Lee Jones <lee@kernel.org>
Cc: nuno.sa@analog.com, linux-gpio@vger.kernel.org,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250614-dev-adp5589-fw-v5-0-7e9d84906268@analog.com>
 <20250619133834.GC795775@google.com>
 <d20682874dbd65acde8b80efa004706a09b23248.camel@gmail.com>
 <20250701110522.GK10134@google.com>
 <15ba1febb0f0acf4057af64c5c84db0633cab864.camel@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <15ba1febb0f0acf4057af64c5c84db0633cab864.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/07/2025 13:09, Nuno Sá wrote:
>>>
>>> I'm about to send v6. I just have a question regarding the above. Do you
>>> mean to
>>> have the log in the commit message itself like DRM or do it with git notes?

No, standard mailing list style, as explained in submitting patches. It
has example for exactly that case.

>>
>> I have no idea what git notes is.
> 
> It pretty much adds a note before the diff stat but with an annoying "Notes:"
> line. b4 seems to ignore it anyways.
> 
>>
>> Simply place the Changelog inside the patch, just above the diff stat.
> 
> There's already some emails about this on v6. I ended up doing it DRM style
> because tweaking the patch before sensing is surprisingly non trivial with b4.
> Unless I missed something.

It is trivial with b4 the same as it is trivial in non-b4 workflow. git
rebase - that's how most people work.

Best regards,
Krzysztof

