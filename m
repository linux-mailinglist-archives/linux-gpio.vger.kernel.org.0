Return-Path: <linux-gpio+bounces-7166-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8B48FCDE0
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 14:55:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32644293545
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 12:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552231D24EF;
	Wed,  5 Jun 2024 12:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFHc9p+g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA961D24E1;
	Wed,  5 Jun 2024 12:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717589191; cv=none; b=p062Qigy6SGETiPU21H/PrQ7Silni1ERNAnwCx65+ziMSyu5Au/VRTc3xH2bDrV3ZGztMGWcrOSrSOcEuuULvRidJJq87R9sAzPhnagx20cVTy2Y8LxX6MK6cMsmvNF6jj8sqDGKGDBoDU4diSuowfj9Z392Oz0b1Q8TGOw3i9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717589191; c=relaxed/simple;
	bh=lortl1z76Nmv2QOyONeN62az8pvnboP+S0JeNy16iZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WP7lpGr9FvbmkFwyLNSbPbrSfyASfTnnieAkdB1+BZZfrZM0NbimdLO2w0TJoajjR3Aws/9jmcEdpeN2A6aX6d0yOkrGr7JIenrRoTMxe1U0jkIMSixZFn46I1bOSFD5juX+Gv8RUzty8AWdLqtytT4l3ya2KXoxCBCbKTma3PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFHc9p+g; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e73441edf7so71742421fa.1;
        Wed, 05 Jun 2024 05:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717589188; x=1718193988; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=du0NeTxqutcJ2uTplQDMRL2aMycCdl9mM4JMoH82dDg=;
        b=fFHc9p+gAfEADWS38dy1J2/5VARvtOSwq+ryaafZecz8M2zRt+KCpE/9WFt70OJ+Wr
         MBsztd5HqHPU78CDEm7ncoyIujMbqI828z3RQLRXOB3DWqZLbSmQkw8k9lvfdWgsuwKq
         aAOkY2YWwvnvUTm+4rmWfZ4oLjrgmbmFfhmtNGpGOHZUac+qxl1Z5WV/obV1m/iCI8k3
         wF+OcdFdt/gClNe6TKga0bdC847djohKdw1Hj++VXLOYGeIuIRvs5xLciHLETVcdSWo2
         yiZbJUdF463DL8JEkdYF51GdYF/oyn+Nh06dpj7U4tm41NeDW9MlZ36fgaQT5SMAZUPY
         Ditg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717589188; x=1718193988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=du0NeTxqutcJ2uTplQDMRL2aMycCdl9mM4JMoH82dDg=;
        b=HO5KJ/pLoQgtT+b54qyxLIe3g8EZFI74Z1WAXPcv9LNp13HL3M38IbU34UlIXJ+SoR
         Hoe13n/eBGQ06vGZ7FfxsA7Lj+Am1qHEUqznJbaDQ7lWSzwbarTPIrKvQAFZapzV9lmv
         uzMufofpmrnYKTOwOSRGbBLJTWkW3cG30cBujiX3L1fRCaQGy5xnWZl3e1+fGc3wnBLn
         An1c3dn0KNrwjQgBuKXMdyaNBmF1PU0s4SSfhPKGf/HX8N9yjGWVNf1lONlzeVwKAnIr
         Ad5vbvDx4kigq8WgR9cwHJ0Dpfa9BqZQFihUlpMOdStRKkaH9gfAzRm27eTxE2byxfLw
         3b0A==
X-Forwarded-Encrypted: i=1; AJvYcCXbnGiM8ml2g6/vQyAsYJQ36CfM8tyOJZOcZp10Cys3jy4vVYiEED/qXap0q3LfJJpJiOOBy/aHU46WiSylpVFOLwvHqn5Hlzifu+Kcl0BLZa+K9zaOuOt5Acnq2/+QS0N4HXmhnd8Q5MHUoEZ++M7hQkKcuBfIokdVd4pXf4cr7Rt4+Qo=
X-Gm-Message-State: AOJu0Yxt1sCHY4F9m2/hgNN4JwssB5ZwKIQYSgjcCkb8Gb7fgcAkt0PM
	C+PyZeaPGR0q7Fpstbku6RLBNNVzbdh+0wnTtV4hHRlt52gBznU6
X-Google-Smtp-Source: AGHT+IHV4exuth1+KkRgJIPAqJ821frbB5sqYY2gJmqLgu1Rrc9bE5yF9v+X4EEGzDscj3iPlac9tg==
X-Received: by 2002:a2e:990f:0:b0:2ea:7dbd:adbb with SMTP id 38308e7fff4ca-2eac7a92a37mr12145191fa.50.1717589187277;
        Wed, 05 Jun 2024 05:06:27 -0700 (PDT)
Received: from [10.20.30.169] ([178.218.200.115])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eac2373686sm3559381fa.43.2024.06.05.05.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 05:06:26 -0700 (PDT)
Message-ID: <d61bdc61-3375-4981-ac55-4004776aabe3@gmail.com>
Date: Wed, 5 Jun 2024 17:06:23 +0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] pinctrl: rockchip: add rk3308b SoC support
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jianqun Xu <jay.xu@rock-chips.com>, Jonas Karlman <jonas@kwiboo.se>,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240604141020.21725-1-dmt.yashin@gmail.com>
 <20240604141020.21725-3-dmt.yashin@gmail.com>
 <b5d2d914-0c2b-4cd1-b894-f894a93a54f9@moroto.mountain>
Content-Language: en-US
From: Dmitry Yashin <dmt.yashin@gmail.com>
In-Reply-To: <b5d2d914-0c2b-4cd1-b894-f894a93a54f9@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dan,

On 6/5/24 12:22 PM, Dan Carpenter wrote:

> On Tue, Jun 04, 2024 at 07:10:20PM +0500, Dmitry Yashin wrote:
> Why does this one have a Fixes tag?  Isn't this new hardware support?
> Possibly patch 1/2 was not actually a fix but just preparation for this
> patch?
>
> regards,
> dan carpenter

Initial pinctrl support for rk3308 included registers for rk3308b variant, which didn't work well with some pins of the first SoC and these reg's were fixed in the patch mentioned in this tag. So I added Fixes tag as this patch brings back proper setup for rk3308b and 1/2 indeed is the preparation. Thank you for taking your time on it. Perhaps I should describe such moments better next time.

-- 
Thanks,
Dmitry


