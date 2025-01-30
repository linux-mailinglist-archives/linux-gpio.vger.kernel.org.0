Return-Path: <linux-gpio+bounces-15114-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B193A23715
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 23:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D76E3A6DCE
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 22:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4011B4253;
	Thu, 30 Jan 2025 22:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="AWPe+jch"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB99D1A83FF
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jan 2025 22:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738274912; cv=none; b=sSGLUWgLfVNGdDIiZayJH5qgZ8rsA8GqtX39/dA8p8EyhfFgjT3igPQQyXWeIWRqyxSsm1V5jsA4eUGKkNvs+cONAbcPljzhbrOp6rzvXjyzFHuSlMjJRh04QKoWpASxHIr0nOrYiFVAJh9yAsUreYINz9VoOLVEA5pT1whkZCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738274912; c=relaxed/simple;
	bh=Y0wTGw7B7jutpSaOB7PCsMIP+mZDG4neJaHyu279Gbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eyIyG4bBNqFnek/iuknTZr+aOtxmDzKfZEy8s2rCx5UxqhH3rah7N74rjsQ6CI4SBrn5hS2VXK1sFDg6o1Z70Af/+A4wVZhjte8xncwvNzE8s0yl73e7YrnvzxQ/Fy/N4WSk/sJicQnPDHNVyrMyWUDTsQzzwXAuxfpuvGEc6hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=AWPe+jch; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9e44654ae3so217320066b.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jan 2025 14:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738274909; x=1738879709; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0wTGw7B7jutpSaOB7PCsMIP+mZDG4neJaHyu279Gbs=;
        b=AWPe+jch7UBhS0rw+sflHgQlngmgNWp7ufq6T+ajvn+Ow6ptwOSh6K/BPV+hocWLCm
         sCa88/cCJXB6vLbm6Ftuj69VIBBeplvReImG4yDI+1eQdNrLctmZbF72KW/G0TAkFBAX
         deSfpewhhsTK7UJHN3Hnky0MmxaveA3Xxto+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274909; x=1738879709;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0wTGw7B7jutpSaOB7PCsMIP+mZDG4neJaHyu279Gbs=;
        b=IzWcJljb5n43zYEYmTDhUEpsfFNzTQJen1e7slWZvqjVl2valhAxTb9cLTaTNsmGfm
         JG7Uf7YNIwHcQ6D+IGJlmGtqW+57FloU+9+KzMEahP0VAv2P8IYxLaPsurdcouzcXH5Z
         TOI/zmFg2ADAWznMrJVaD1DzlciHYx2eat6b8EVQuZxfOOfkzsQeMl5ZoX4YsXTWPmeF
         XMczNysZPmeNbyInO0cY1GwJNcXEbnKqVG2lSd6cx0UU0XReIEkJXZLAM1ViBXSnpUpl
         o4x2lJmuYhLV+jrj/mL8tFU/SrqM2yV8Ojub1msXDw/b7OE3rluE9uM62Map3eOPSq8H
         CX5A==
X-Forwarded-Encrypted: i=1; AJvYcCXinym7XL0MracHP7q7S+xGXFq/V6HEDvLXRYXUxgcHyOugOas0zoKcCHFQRNKLkYxWOybng7f4uCKI@vger.kernel.org
X-Gm-Message-State: AOJu0YyPAAKSF6dMxQ4ud+NjsSvz/JSN7+bVvkAQfpjMEa7PCNasnLdy
	YfByW4G5gHN2oYToAyqOohe6BWjhmS5W/7qqq7OwnzNx0eK8hvoy9HMYU8YrWPm5BNyyMdKDvuG
	ZjgZ9l/iWzZvdiiNmfvVA76XLuog43p9EfWjM
X-Gm-Gg: ASbGnctrOKKrWtZ74jUXchUPsMbWUvrbbGENK48RTup2SksD+plU7pxtjiMekmvSG1c
	OpDzxHR4Q1PciKU0ez1OioGtO6tgmej78nWGoVt+yzlt83hJC4GnGmOtp7s92guUokBTXlDX4Zg
	==
X-Google-Smtp-Source: AGHT+IGrldTrNZ/8c9oljwo8V8v/OfXDxUYZgCi9ZOQfkkQ0USnqsaihfnBuyvdb31AwbQWf8XI6HE6g81DRomBomuY=
X-Received: by 2002:a17:907:94cd:b0:ab6:3633:13e with SMTP id
 a640c23a62f3a-ab6cfdbd071mr1038802366b.41.1738274909232; Thu, 30 Jan 2025
 14:08:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130-kona-gpio-fixes-v1-0-dd61e0c0a9e7@gmail.com>
 <20250130-kona-gpio-fixes-v1-3-dd61e0c0a9e7@gmail.com> <5fe49a62-b40d-480f-aee1-224e17db9f02@broadcom.com>
In-Reply-To: <5fe49a62-b40d-480f-aee1-224e17db9f02@broadcom.com>
From: Markus Mayer <markus.mayer@broadcom.com>
Date: Thu, 30 Jan 2025 14:08:16 -0800
X-Gm-Features: AWEUYZkbCoPpeT38Ui9RvO4h30F7SEA-SB0kYSU2MnOybjnditaCJPOPj-LMgKM
Message-ID: <CAGt4E5syrqpPs7=euvU5xJAsjb58Cp4+oOc_erfhpuuLcLy_gw@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: bcm-kona: Add missing newline to dev_err format string
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Artur Weber <aweber.kernel@gmail.com>, Ray Jui <rjui@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Scott Branden <sbranden@broadcom.com>, Markus Mayer <markus.mayer@linaro.org>, 
	Tim Kryger <tim.kryger@linaro.org>, Matt Porter <matt.porter@linaro.org>, 
	Christian Daudt <csd@broadcom.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000081d993062cf3aae5"

--00000000000081d993062cf3aae5
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Jan 2025 at 10:41, Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 1/30/25 09:10, Artur Weber wrote:
> > Add a missing newline to the format string of the "Couldn't get IRQ
> > for bank..." error message.
> >
> > Fixes: 757651e3d60e ("gpio: bcm281xx: Add GPIO driver")
> > Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Reviewed-by: Markus Mayer <mmayer@broadcom.com>

--00000000000081d993062cf3aae5
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
Ec/cP+EhLb6iWo+xOyG5tQ5x6rHF/myv8D6KjCGPNA244wCq//YJpACZxW/EmFhKpSMtJiOK3y6K
J6mUZis5jzWGejheX/GcA6ZPj1cg5HiVZ7jtolAr16MCAwEAAaOCAdowggHWMA4GA1UdDwEB/wQE
AwIFoDCBowYIKwYBBQUHAQEEgZYwgZMwTgYIKwYBBQUHMAKGQmh0dHA6Ly9zZWN1cmUuZ2xvYmFs
c2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNydDBBBggrBgEFBQcw
AYY1aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAw
TQYDVR0gBEYwRDBCBgorBgEEAaAyASgKMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2Jh
bHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwSQYDVR0fBEIwQDA+oDygOoY4aHR0cDov
L2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcmwwJAYDVR0R
BB0wG4EZbWFya3VzLm1heWVyQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUpTl9ZDXeYdmvmTJ/9G5fdl5b
VawwDQYJKoZIhvcNAQELBQADggEBAEU2+9J4vQL2/+vHKw3JI1Euy99lcSBuEH6mm1PKer5G4WUm
bYYQ4A8XEDIPRdaWE8E4wpvrQU3GUFtHA+YT99qbcqf8ttU2zZCQ17djBSxfPwf5LVy9dBmtBS+s
6EXfI524CvSPzUT0wlJIvMEWJW2T/lBW52QpDBdsLFVisRbMRBfSemhxXYPDPBNIru4ojg5BP1xo
f5USQusyoaAQGD/iGFhbsfaGChOJ7+MrfFFZqvHK9GWNFg5citmQzQvN6p2/IdgaR8mJRMIpvq1z
iJSmEbdepvACxpoFNicZvebbKDcUwP4gmmiqDqnk9jy8cYDL/MgucszvSNowyevsrKcxggJtMIIC
aQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQD
EyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwPPzUoCioaoirhBIcw
DQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIGRZETsGa3Ox2Jbto8k99n06Z5l5ddtj
cpuZnogISELPMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDEz
MDIyMDgyOVowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCG
SAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQC
ATANBgkqhkiG9w0BAQEFAASCAQDE6SvTRd+ylmyqrYGtVLdi6hDuUdgisC9laCCaS1U0pYuSS9Xs
yGUB415NIy8VmDQhbP7kw4JkfRKYe2/C7fQ5TPcwEFjeW9flFmhU+xmlZoO8jqXGxKMQG0YN1w6H
d17b3J12LZj6sExGgPwQp56m2+4owOoDNCStUbN9G912kM0T0wZ7JZX+bLEnCUiBKnYtQVngFy6u
Nqz2K3CDmmnnKLRMNTyINZzse4rhUStwAB6DEMT2vpw34b3tEsJpCI6hs2AH7NyZpmeS2Dx1ah2m
MqiJ0kRXYkEXACvjHFJ7JqXThr+7a/7MbQNPhbPpCos5kG/OZ339LIxuGCNGm0bj
--00000000000081d993062cf3aae5--

