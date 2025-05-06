Return-Path: <linux-gpio+bounces-19706-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA8CAACE58
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 21:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 120727B9876
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 19:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A136E20D50C;
	Tue,  6 May 2025 19:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIFDjmZN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00E51A0711;
	Tue,  6 May 2025 19:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746560783; cv=none; b=X8/7SsS9ayDPu1Vn3w5azaoY4rg6GvI9exhoiGf4b6SbcpuIKJDqOvXzNgUO2ROXXuseBVZ8Cr5KZerdGySp0trzM30zAZZKZjoaFycR8jLdxTLBkEnfW0iooHtMbnhoTb+bzFEqKwAZ2O0PeUsWkSzn+WC/oV5/ZRdV3LUOQgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746560783; c=relaxed/simple;
	bh=nyBFWOS16j2iYBmOVbC3IgQlsPucbfukndKQCZErJBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lxqI2ME3cArf4Sv6PQhSf3uxij/+RxtjtGI7fIk3qEcivprrrqChXriwuaoZLu6Ugl1GS0AHJoN2hKRXfSc6tuMPAsb0M9jwNdkTaOBp37oqHL9s4PyN7WUO07/hlRAfE8bHv06Qai4oe4VNfS1T/JX6gRfDqObURn1MqlAma7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIFDjmZN; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso9283213a12.1;
        Tue, 06 May 2025 12:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746560779; x=1747165579; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=smuCQykHT+vVpyG3o1FnOfymv4/KjoNvv2ZwLmkWFQc=;
        b=TIFDjmZNT4TrB/OM0NycBNLaY1A5NveyXcTMP7YSKV1rPCH742I3b76zgU6eCR8XYB
         ex1zmQiOkBkvKsfrwqlOCM7Zvn/2KB10tVQL+lUuU8QPSGtQEZAoqRmMK/LIUSRp/Hnh
         S/i90380ymvTYOdGqdn7BAuFRUcNptbycz4QXs5qUd4WcNr4rXiTQ85QeBdekaH/TPBM
         +zqgibfP5vhzOqWGfHBGPvtD71YSQbCgrdFQfkBgIMp9dFYgu+pD30huQAauQu4BD2ys
         1A7Bl/aw8Ar/cG3uePzL0lh52k7TRgo1f3Lew8YbVgLzvIMGB+H1Ups2vAqDx+JwbCxs
         Ce3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746560779; x=1747165579;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=smuCQykHT+vVpyG3o1FnOfymv4/KjoNvv2ZwLmkWFQc=;
        b=HfH99FLYwe92wDXNa23pNub+sKScTNbfUyvdkC5fjcHJFs92RWyYCrAQVWytxGVEiU
         68UAQ/WAkiLfIJbq6pQFtVjDHqH0qnNVwNLJ3uG5sW/aUhuHga+XPfeAf50VBNgJxIYN
         amgMjxap+4pGkJwhNDNXPVPxRiR1Z/vvctmn4aRXtMq0IzCRs3iLXyssAdIaE78BfSRw
         CuxIhdwVLtVrpoVbHqL7Lt5MWRu47Ncd3xiYDvJBZe1Mi8JOuvsF/U/31D+1+vvsqJCw
         yZ8VepR7ydjBniRtPSf8gx//SdQgPRhXF0gOxj58Pfiy/4nzp5TMF7ZuWlGNfOHN5wGq
         sNfA==
X-Forwarded-Encrypted: i=1; AJvYcCU40Kre9EErO2erbb6HBpIEipJO1MNBiyVG/khKA3Hj1pDgl2QCuqrhBkn4mMdf05ooIP9cXZPywHSPFxAo@vger.kernel.org, AJvYcCVPgReFhgzRThiex7J3xuoC8loUa9jmNvfAvkBMwQoIyd/JGkcJelU4hMB06O5QJg3TCESPcVpHlqcc@vger.kernel.org, AJvYcCWp70Tc1lbpSi+xCo7MVVvqNHzxYqikvEhwiGuC8b0mEEiGxO+StlzCz/yqju5UaC3L3fFykY8Aavd3kwQ=@vger.kernel.org, AJvYcCX473v9rJyiw0R2Og6OuUTaVKtxpjdwBCpe0r9mB0eF0/cipsLtS++wfPtVpP7VoQ/fEFUJfyfOrt1DHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNDp9slLnPSguFUXuyKHOQXnMktIPMAjxUm8u5+Bxf0uuMNdO7
	2LfOAseaDWYFkBOrw/eiXlSKqMPYvPzZpyA5DUW2waRH901mhtat
X-Gm-Gg: ASbGncsED+G4cLAdZNKHdbJ3EKsOPDC07tQfOP8F6/dAVHiEkG1zhA54HU9DWTK1q2S
	vUaZuO7pycoJD/DApUVOJOYK+Jw5zvBY3vg/NXieRKbVQKGgwJ+D7wg8+gOiNyaCzktWNTLAp8M
	xQk1gWhRFWRAV11X+bZK9phlZG5bvg5jv97J7Z49XgYqw3VbAGIZRE0junGXrF79C/7m52RFBbs
	Xa8knKPKRE/N0crQfVGXsTpUs5P/5YA66oqd56QfFLs8Tp9moIbUazS9VwqgXbG49cq3p/Bhc2w
	2j0SnHVdV24VNzS1E3dOHaehAGQYRXts72AWKV6iclTg5Q==
X-Google-Smtp-Source: AGHT+IHF3pcKHZxx5T+TWyDWO6i8RnZU06h3QHjYT6OlLwaA6F+B11QDpeLyDwyzcv9mQtYOntSFew==
X-Received: by 2002:a05:6402:1d4e:b0:5fa:8277:6031 with SMTP id 4fb4d7f45d1cf-5fbe9f3c5a1mr395090a12.26.1746560778503;
        Tue, 06 May 2025 12:46:18 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fbcca170e0sm786106a12.3.2025.05.06.12.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 12:46:17 -0700 (PDT)
Message-ID: <eb2f0337-9261-4867-b6e2-dd6ca2fd25fa@gmail.com>
Date: Tue, 6 May 2025 22:46:11 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 12/16] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Jakub Kostiw <jakub.kostiw@videtronic.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund@ragnatech.se>, Julien Massot
 <julien.massot@collabora.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Taniya Das <quic_tdas@quicinc.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Eric Biggers <ebiggers@google.com>,
 Javier Carrasco <javier.carrasco@wolfvision.net>,
 Ross Burton <ross.burton@arm.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Zhi Mao <zhi.mao@mediatek.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Ihor Matushchak <ihor.matushchak@foobox.net>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-13-demonsingur@gmail.com>
 <b214bf8d-33d0-4da8-bf16-cc62bd1fbd55@videtronic.com>
 <f22f1343-9b7b-4ae6-9461-bc1b8108619f@gmail.com>
 <d4165e96-7587-471c-a7c5-ffa26531a796@videtronic.com>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <d4165e96-7587-471c-a7c5-ffa26531a796@videtronic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/6/25 10:15 PM, Jakub Kostiw wrote:
>  > I'm aware of this issue and had it fixed locally, just haven't submitted
>  > a new version yet.
> 
> Great !
> 
>  > Are you setting a specific polarity on the lanes? I've validated
>  > MAX96714 (after the upstream submission) myself and it works.
> 
> Our design has all lanes inverted, so we used:
> lane-polarities = <1 1 1>;
> 

Got it.

Can you revert the change you made to polarity_on_physical_lanes, and
try the following?

diff --git a/drivers/media/i2c/maxim-serdes/max9296a.c 
b/drivers/media/i2c/maxim-serdes/max9296a.c
index f48f5b68a750..dea0518fd790 100644
--- a/drivers/media/i2c/maxim-serdes/max9296a.c
+++ b/drivers/media/i2c/maxim-serdes/max9296a.c
@@ -474,7 +474,7 @@ static int max9296a_init_phy(struct max_des *des, 
struct max_des_phy *phy)
                  */

                 if (priv->info->polarity_on_physical_lanes)
-                       map = phy->mipi.data_lanes[i];
+                       map = phy->mipi.data_lanes[i] - 1;
                 else
                         map = i;

data_lanes is 1-based (since 0 is the clock lane), but the bits
in register 0x335 start from 0. That means we should adjust the
values in data_lanes to be 0-based.

> Only after mentioned change we managed to get the video stream.
> 
>  > This should already be implemented by using different numbers in
>  > data-lanes property in devicetree.
> 
> Awesome, this will come in handy for sure.
> 


