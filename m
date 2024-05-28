Return-Path: <linux-gpio+bounces-6733-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2079A8D1AEF
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 14:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D00EE2847E3
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 12:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6117916D33D;
	Tue, 28 May 2024 12:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGb+i24W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906A279F5;
	Tue, 28 May 2024 12:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716898724; cv=none; b=ONTaRPgDRDL6D74xRT/XXoPBOQydDonC/jH0yazdZjd2LolIVu4bH0EDCrzmuqu8vU5EyvGtH7MwlGyVuNr/Fc20xKDmTmuihxk9Im2DNdujvqq5xg4JCn+s7M4HJ+iaLpgCl3RzlTu5zL6gl+wZ9c4RPRpNfpxySLwVDm76jhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716898724; c=relaxed/simple;
	bh=lrFI0/wIbmca4cXxnFcjytkpyrMnj3siPkLehlAEFjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tg13nAhnkkJVWlXxFz1HK/XbM9YeQKoyiNbaeUslPvm7LwbuVkgKfWV/LvZ2TWCwmHU6E5h3LMYRbqSnUg5A+kbIYZzeF1TJeKojedmnIKWqKR+wOWdTZfccXByvl1dEqMpyDXKmM4qPnjjT2g0uvmo2nBUvHT8Jur0I+gGVsZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGb+i24W; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e95a74d51fso9886461fa.2;
        Tue, 28 May 2024 05:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716898720; x=1717503520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jLL8Ft99cJVseIi4ayW8bS5YO6VTvNhFoRwZq32Fda8=;
        b=IGb+i24WuT1LOs/Kl0e//QQhwIBQ6nrRUzqpRIzdke6MnbYlPMyTN/Vilz6ouNu2sI
         E5fuBF+nlyAIWfY/b2NrKVVewpciEAAbXr6ToiDJlaS08m5xKykiQYSB6s/TYMzTGXRu
         nenSkE8YIOeGjMNcyeSG4ksajOny/Jn32jHrdIv3LF5ZvYwD7ERDr1fr5T9SF/+G7E32
         naz1VaCOHMoDs7zxqVjhwC48vwe+cB4+nIEEpNcO9F2RIa0oCLr92Gj1ahOkP+Rks98E
         T2Eq1D5NwPhBQc8SqeOsSXugeSWzBEoa67S1Gk2HDljJO6ruEX8aczW03bCDYcYajpOY
         4nbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716898720; x=1717503520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jLL8Ft99cJVseIi4ayW8bS5YO6VTvNhFoRwZq32Fda8=;
        b=ic4ni1BpYB4iZr4cKMbiJFlSIv1gxSyO3gDq/2Up+AMltH97zhy0Dbe0hFzkA+AxR+
         GZzJ7T5ecgf2pmQ288CorOz5h53LNzDEtkmV3u0lcPoDgmuILfrCjeZxK2VXCrWBB8vI
         hZEUK9RwNuUsRia1x5kE2YpPG5TaT8cavCtjjL7m2bsNd5Yk9h9GuIbASyMnOQiWN3qy
         fXdEZQ4F59vgFtKm+tkzxJAU9SFlT6Nl84+yAoQfNtwrNsnNgi11qhzolFmZWVCI3KU8
         PJ7P8vwSDN0BCAtTuw7RnfwdomgTUVduhsuzS4OGfCST3nEnyrLtXcOFBZQXcw0MrL3i
         /+9g==
X-Forwarded-Encrypted: i=1; AJvYcCX05nbFaC1x1EHelgWFesb25bUSjVVNEpTPtPT/KiZqsfI6bZrzuWL+Dr7pyw0iTDUvTbzQOSyPPjJwPIVH+zRUiQdsNAzbDIFJgsTG2syrWSed6TLNofOepLsGvfUzJP8shnksQbnFjUTu+zJjO/dPdKzdq1DQ4BOEu2kCcITMK+mZmvs=
X-Gm-Message-State: AOJu0Yw79NDxmmT7w2miefWHX/zhHFSXhJCnFlCaf6XZJJTqFLm8Xklh
	5ubT0cYhfZ5LImNbabPrZMglqOHWOni4G3LeHxE0CkLjLsMaZqn7
X-Google-Smtp-Source: AGHT+IGc0NnrB9tTNcE2A4QQn3xBsUhlCFH1lh48wmiR1tIpieoZLdQlD0imMwEebqbi4mFbk8xh6w==
X-Received: by 2002:a05:651c:1030:b0:2e9:8c0a:746a with SMTP id 38308e7fff4ca-2e98c0a7a92mr6741881fa.52.1716898719317;
        Tue, 28 May 2024 05:18:39 -0700 (PDT)
Received: from [10.20.30.169] ([178.218.200.115])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bdcc963sm22551431fa.86.2024.05.28.05.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 05:18:39 -0700 (PDT)
Message-ID: <a54be779-9728-4ac4-9b85-8cf6787f491d@gmail.com>
Date: Tue, 28 May 2024 17:18:35 +0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] pinctrl: rockchip: update rk3308 iomux routes
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Jianqun Xu
 <jay.xu@rock-chips.com>, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dmitry Yashin <dmt.yashin@gmail.com>
References: <20240515121634.23945-1-dmt.yashin@gmail.com>
 <20240515121634.23945-2-dmt.yashin@gmail.com>
 <CACRpkdYO_zr=OEZCv8LKtw+fNOwJ906ZVKyPhbbyA=9gP5XQgg@mail.gmail.com>
 <1770701.X513TT2pbd@diego>
Content-Language: en-US
From: Dmitry Yashin <dmt.yashin@gmail.com>
In-Reply-To: <1770701.X513TT2pbd@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Heiko,

On 5/28/24 4:52 PM, Heiko Stübner wrote:
> Hi Linus,
>
> Am Dienstag, 28. Mai 2024, 13:29:12 CEST schrieb Linus Walleij:
>> On Wed, May 15, 2024 at 2:17 PM Dmitry Yashin <dmt.yashin@gmail.com> wrote:
>>
>>> Some of the rk3308 iomux routes in rk3308_mux_route_data belong to
>>> the rk3308b SoC. Remove them and correct i2c3 routes.
>>>
>>> Fixes: 7825aeb7b208 ("pinctrl: rockchip: add rk3308 SoC support")
>>> Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
>> While you guys are thinking about the RK3308B support, is this fix
>> something I can just apply?
> I'd think so. I've detailed stuff in my Review mail I just sent.
> Both the soc itself and also the affected pin functions are niche
> enough that this should not cause breakage.
>
>
> Heiko
>
>
>

Should i just drop 1/3 from V2 then?

Thanks everyone for the feedback on this series. I'll prepare V2 based
on runtime chip detection with use of GRF_CHIP_ID.

-- 
Thanks,
Dmitry


