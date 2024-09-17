Return-Path: <linux-gpio+bounces-10229-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FC397B3FD
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 20:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11020B242A6
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 18:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64ADE17D377;
	Tue, 17 Sep 2024 18:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="CYjx7Pvz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2C138FA1
	for <linux-gpio@vger.kernel.org>; Tue, 17 Sep 2024 18:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726596786; cv=none; b=YVF1ZwLXwu6oawStsqgwo2+HmIJ8Z1vbCrGbs3rQYWh62k/olLWshZmC+BkcgCOZBdipY81Z92/ZJ3a+mWPno8b7JfenQr0APWlacDyzQnHGWPPazZf7M+m6Jd2bMeBFejt7uEoLUc3+x1jXUNwmWB/IylnXH1qS5btEHuHOBYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726596786; c=relaxed/simple;
	bh=4D5cGZ/wMJaJH5HOK1OWVUklX5zkr2d0SSy+yhY8oy0=;
	h=From:References:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gjNbdgppO5vfGtlTIpA+9fmmvYhU1acTYvi2vGYC3Xeg7XlWlswcNL2SKp8i4z7nBIEQxz3JP8+0++EAGAY7mSKUIlZIyOVy+C6uduKdE+0oEFysY8F6ZTVeX7h09so3v3VzlC3hIL2WJIHrTlOIq1TcbvOxcp+dRvdPXDfpGns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=CYjx7Pvz; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-846ca104682so1207309241.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Sep 2024 11:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1726596782; x=1727201582; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:thread-index:mime-version:in-reply-to
         :references:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G5tWkbc3ToI6wYYBXWVOzKp9uX5mSH5eWAgRnP0KMTU=;
        b=CYjx7PvzmEQ24m708GrXpQa3kazG5PSt+Q8HMeUxkUS3nyvl0cJGRDjPoPQKjY51j5
         eXgydXJ/d8uW9FYi2hMGwujnx2JMV4NrVAJUhBvGKsm+d3/EMcgZhlIq0vttRNPFPdjz
         p5++jaEajHlmrLMqkJDusVgcyYVKvIcq9ku5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726596782; x=1727201582;
        h=cc:to:subject:message-id:date:thread-index:mime-version:in-reply-to
         :references:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5tWkbc3ToI6wYYBXWVOzKp9uX5mSH5eWAgRnP0KMTU=;
        b=sSzQzOWQvOJjOcacsnedgUQ9oV8Mv/MF1yUWW0zEBMv/XoTGKazIuwmZmsI+tjF5oP
         862aGuwPhacOwkeZrHqhxf+lQPOinMjqZhTWzY3AFUZVimHlrfg7Tp+bf/mExzetRl4t
         NgQMVfVZVKbioDzWoaz6brQoKKQIo171X+HXwqOAqzFtYFPHhIvCOukiFb60cKiHJtG2
         y42YaBPzef9M/bsytuPXa/RAuFYHfdRcVBOyDgm/76jAx90qImapaaVDTe1fFL2DeBtb
         dz1949b3XXj65G72dt/a9SoBKGd5UkPeEO3ZNRhHQBrTtNucno6y6QFft19kTiUdp+0Y
         J8Dg==
X-Gm-Message-State: AOJu0YxJ+BJkCtUuszGxj1y1wn+0ixRQIKYal67VQRYM1eGPX4ZJIh9J
	H+EqUccaZHOqgFB+rX+/m7fnC5eiOJDJa8N+564rKiKDGkNxa/uzH3pZo0BsYdCeIdGBoY2qJuV
	AVIgmI+MpTVJqxyQla53hocMG1KA4n1DcOnQu
X-Google-Smtp-Source: AGHT+IFGDVXa6YKy3zvS4i+Ju759nwHQdKmBK1O7x6C0txvt3UHwYXw3XLfG5voRCbpmdnEysBYeLXvEWeVL57HuY8U=
X-Received: by 2002:a05:6122:4a17:b0:503:9ccf:f2df with SMTP id
 71dfb90a1353d-5039ccffd1cmr2405938e0c.7.1726596782409; Tue, 17 Sep 2024
 11:13:02 -0700 (PDT)
From: William Zhang <william.zhang@broadcom.com>
References: <20240917-bcmbca-gpio-mmio-v1-0-674bae8664cc@linaro.org>
In-Reply-To: <20240917-bcmbca-gpio-mmio-v1-0-674bae8664cc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJKeFGxlsqZAx5ijpASpfBnOvUsvbF9YfnA
Date: Tue, 17 Sep 2024 11:13:00 -0700
Message-ID: <6becd9863d87720dff1a1677c7433af8@mail.gmail.com>
Subject: RE: [PATCH 0/2] Enable MMIO GPIO on BCMBCA
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000e80bd5062254a36a"

--000000000000e80bd5062254a36a
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

> -----Original Message-----
> From: Linus Walleij <linus.walleij@linaro.org>
> Sent: Tuesday, September 17, 2024 5:45 AM
> To: Bartosz Golaszewski <brgl@bgdev.pl>; Rob Herring <robh@kernel.org>;
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; William Zhang <william.zhang@broadcom.com>;
> Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: linux-gpio@vger.kernel.org; devicetree@vger.kernel.org; Linus Walleij
> <linus.walleij@linaro.org>
> Subject: [PATCH 0/2] Enable MMIO GPIO on BCMBCA
>
> The Broadcom BCA (Broadband Access) SoC:s all have a dirt-simple
> MMIO GPIO.
>
> It's exposed as a direction register per 32-bit block at
> (base) and a data register per 32-bit block at (block+0x20).
>
> However I wouldn't want to use any of the old compatibles
> becaus for this undocumented SoC I have a gut feeling that
> there may be registers we don't know about at (block+0x40)
> etc and a separate compatible will be needed to slot in
> a more elaborate driver later.
>
For the BCMBCA SoCs(ARM based Broadcom broadband SoCs),
there is no need to access any register at block+0x40 and beyond
for gpio function to work.   So I think the existing the brcm,bcm6345-gpio
fits the bill very well and don't need a new compatible IMHO.  It is
the same tradition/rule for other blocks like wdt, nand controller
and etc.  We use the oldest chip name that has the common IP.

If we upstream more elaborated driver later,  it will be a dedicated gpio
controller driver and not use this basic mmio gpio and we can have
the new compatible.

> Let's do this the hard way and create a new compatible,
> and probe regular MMIO with that for now.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Linus Walleij (2):
>       dt-bindings: gpio: Add BCMBCA to MMIO compatibles
>       gpio: mmio: Support BCMBCA GPIO compatible
>
>  Documentation/devicetree/bindings/gpio/gpio-mmio.yaml | 1 +
>  drivers/gpio/gpio-mmio.c                              | 1 +
>  2 files changed, 2 insertions(+)
> ---
> base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
> change-id: 20240917-bcmbca-gpio-mmio-5da863cf5a5d
>
> Best regards,
> --
> Linus Walleij <linus.walleij@linaro.org>

--000000000000e80bd5062254a36a
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
YDZuuBJwnyCzevMoPtVYPharioL5H3BRnQi8YoTXH7/uRo33dewYFm474yFjwwnt82TFtveVZkVq
6h4WIQ4wTcwFfET8zMkELnGzS5SHCl8sPD+lNxxJ1JDZYwIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRp3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUq65GzwZxydFHjjYEU/9h
xHhPWlwwDQYJKoZIhvcNAQELBQADggEBAA2hGG3JPAdGPH0ZdohGUCIVjKz+U+EFuIDbS6A/5jqX
VhYAxZlzj7tSjUIM7G7IhyfqPC46GKJ/4x+Amz1Z6YxNGy71L68kYD6hIbBcA5AM42QBUufly6Oa
/ppSz3WoflVyFFQ5YXniZ+eU+2/cdnYZg4aVUnFjimOF5o3NfMLzOkhQNxbaDjFUfUYD8hKmU6v4
0vUBj8KZ9Gi1LIagLKUREn8jku0lcLsRbnJ5Ey5ScajC/FESPyYWasOW8j8/1EoJksmhbYGKNS6C
urb/KlmDGfVrIRYDbL0ckhGQIP5c6L+kSQZ2sHnQK0e0WgIaZYxaPYeY5u0GLCOze+3vyRMxggJt
MIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwxuh2XG3FXRL1W
JOEwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIAOIeDz/SL8ecwTbG3m1juZE3uC3
D5q5wlEX7/D7iEXMMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0
MDkxNzE4MTMwMlowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQAponQ8uHMNI2NN16285CksXi43ASYdXSf9VWPhtenofiY5
eGKONOuCc57ghBzQiJsI9m6U9G+5aIo2xL/i6IS+wu/M5FbsjVx4muS02UYt1FME2N47rjWDLSaa
x/AwBSpO476AsOce87SlRs/ZX2QTErQrBEoAQLsPxwmUVhFbr4eKn2MVsI//tbIWTS3z3M6XF139
TXpv5x0yrAATg/yEiWLmViOKvaG8455GAYgYlEsl1yGpsw/vYhTs+acz/RLyVFx9jc3V+F/Q5qX5
ncjgIQ5mQ2Q//xwirqo+5mc6JX76akbFiquo0/AXSmRhNcU+MSxHK0VicWbgT0kpvKnU
--000000000000e80bd5062254a36a--

