Return-Path: <linux-gpio+bounces-17440-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E19A5CC45
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 18:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3BEB1893D4E
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 17:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D053C2620E7;
	Tue, 11 Mar 2025 17:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hy7flkrU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F96F26039B;
	Tue, 11 Mar 2025 17:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741714470; cv=none; b=L6Csj8MHybSqKTM5MpJ7hSXOdpV3HGrcmVV/T4BY1tbxBLtlHIBImS1+TofS1DGviB6k7iI0Mdm5S4PdNpmhggppW1xMu1Go2Ssq91Yv/b+6GmcsRayKmCYNgkmMPWa6WdLDrQaeqvMarAmHyGPb0mU3EBEcAUlnMZFfLwy/VjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741714470; c=relaxed/simple;
	bh=FYR5p1YX8aGi/KqE25+xJQ1RPhbTI2Blq3jqxZem+PQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U2Tzecx5RZ0+AEscEnvGBgxTlVS3KRJs6ZBD8bmIQW5s2VRHumAhIrTM2N/RnL1Qvc1D76u3vx7tWetHb9zgIrUhqG3hgQO8JQaNI7zcwIHCIMXglw7s1b5cs36m4ucEMqbTrmMPkivAOy2UwpMu6QizcJvt5q2kxpE9vdFAP/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hy7flkrU; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so172253866b.0;
        Tue, 11 Mar 2025 10:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741714467; x=1742319267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uF1UtyMLzd/FNPDV0GABgsjA1Fxs5QvrOIcxO2UeUh0=;
        b=Hy7flkrUY6Np2fml4HFago6S8SzG3SOTwOE+oUKrAOHIuuwoNtXEAI2+c/3y+fW8xq
         6H0qXWgyuOArAJKMMOMzAOnRmqGk+LXGPnb6Pu5IQUldZCFCeUirGDfOHB9vtyVesVlI
         JNqlXJ4ADJtYe+Fy4n8oztCe/Us3vz++Ppuaha64C7YueUwm0E6gC0aqRRa4bHp4rgp+
         m++WZIyQy5k+3i9e2Bx5yr2k4tLRLVR7LApBsQyyZCDYToUQtfLAgRTOf379AjKSMkHJ
         4CNa4o4nGVEcORI2eaDWyBAU8A96ANYPJxvU9mb6RUh2QuWEUuBxx+jEzmdsxrfi93bE
         jYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741714467; x=1742319267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uF1UtyMLzd/FNPDV0GABgsjA1Fxs5QvrOIcxO2UeUh0=;
        b=RoMxk2vO43hZtVl8LlYJWbV1BcFuyugh2IW7oGZh4n/rkzAMOAq5lQQUyhBMKDaeZ8
         IvKiwvuxm2RyZiTZjEII9HqWuSP06NPOxmrm7PjpROwvXVjnFXSupelgEKO56aMQxPmX
         muKfTMUeZr7yimRitQxWVXWKd5tQ9j98yQTNRQnK8DC9lXZVV8W6p2F3wmTmXAb8BdGK
         yQD1DoYgjODsFmcrAlfcLbvcjJ9rE6eAJ0NZHAywcGNGYqwblr13soeF0r6him+sJohN
         qgjeAzHJpF17rYwZ4yeRjugoaFqKetqLqMR7NF3bSOpZuGMaXlvPxTDTttSpAul9I9hF
         OSKA==
X-Forwarded-Encrypted: i=1; AJvYcCU/m9LPMNCHjcGveSF38Z26VQGyZRjy51ekzu3Qrs/go758pWQjt1HFtL0l0ZW8NWeg1yXE/ycIaZH0cziw@vger.kernel.org, AJvYcCX5RghF39QY1ISqWwCnCc6ZGtqATVyQru2wxNBWNshYbkBdCrtYvRT7ZS50cIiPoezsiFx3v+h7yN/qfIOm4/Y=@vger.kernel.org, AJvYcCXJ+iO9NGpGb/Lq0idfrDNRbsofqzpWefQep1DzqJTwqi0lwT65bknb1FHOa8UM2lWZQnQzG39SBDloWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQRRoMP0ir5gBSjER+YBRQGsNRNgfKHzRMFZUvF5392GFf9sHw
	WNYg0yo5KSTYtvMtyAD+tiA9R6g1qrFFVbi9Nziiga8qXLwogY6EAs2qRg==
X-Gm-Gg: ASbGncusc2bXRZN4jgTetx2EM4XwD8YG9ZNsnB9r8W3jK32gLoZ/jqk7JNGjF4EtoGS
	didRiSfvxq4aBC5bGnLpcGe3gsl8poyTJtTvNUYeXqw0fz5YM5QfzOnsVuePY/d15xMWizIwwqf
	KSxjxhAMhO8ZdRNzfaDRz9Fb7c/DUDXGQ0n3mgk2nMTMZO/On0EDvdeLaTVq/5hihGQ5Pe/1T4x
	MFRj1eVpKf6je++xEuuLJjCcuhgRXGq0yYHHSiXsF3tJNQbcFIB0vAB28YcSJAjHqGWod5ZG4bl
	jtCtPICl+MQn+Ypd4abwSl4Gq+ohHh3vATM/crRz0qcxOwksNCZMskSAdDXx2du2jNJHBgOalxf
	69wdR9NO1o6P5G4Rp26447w==
X-Google-Smtp-Source: AGHT+IF1cEXKSEStwKqwH/g7+VlE7YBwRrOlCvluK30s9+aYFAfsg1dGkVTnUYOyp9nlYt++njiE0Q==
X-Received: by 2002:a17:907:970d:b0:ac2:b9c8:b7ba with SMTP id a640c23a62f3a-ac2b9c8b83cmr642529266b.10.1741714467029;
        Tue, 11 Mar 2025 10:34:27 -0700 (PDT)
Received: from [192.168.50.244] (83.11.221.132.ipv4.supernova.orange.pl. [83.11.221.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac282c69e89sm540028866b.167.2025.03.11.10.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 10:34:26 -0700 (PDT)
Message-ID: <8b8b9074-8828-4477-93e0-32be63688d05@gmail.com>
Date: Tue, 11 Mar 2025 18:34:25 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] pinctrl: bcm281xx: Add missing assignment in
 bcm21664_pinctrl_lock_all()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <dfc15d59-7fa9-4f96-aacb-37c3df6d420d@stanley.mountain>
Content-Language: en-US
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <dfc15d59-7fa9-4f96-aacb-37c3df6d420d@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.03.2025 11:48, Dan Carpenter wrote:
> The next line checks if this regmap_write() failed, but it doesn't
> work because the assignment was accidentally left out.  Add the
> assignment.
> 
> Fixes: 60d69769c851 ("pinctrl: bcm281xx: Add support for BCM21664 pinmux")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Acked-by: Artur Weber <aweber.kernel@gmail.com>

Best regards
Artur

