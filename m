Return-Path: <linux-gpio+bounces-12387-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B339B8182
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 18:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37BB51C21490
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 17:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355531C6F59;
	Thu, 31 Oct 2024 17:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wGh4HOXk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0431C3F1D
	for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 17:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730396837; cv=none; b=RC39eACdctEUnnZJ+qwB3SepivY/+UdAFN6y/XCKeNMYkhxPp8VTMKCp1609f9nfAu+Yof7/Ne/h8UTKBlB4LXDIE8ooNQ6bmKpIWUrItULLn/PUqtTXOUNWF89Imf9T5Yi09t1kw6tBTPqdAFcx7rCF7WMF8lXZuK70EAGPggI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730396837; c=relaxed/simple;
	bh=etimWnUfHOZ0ie66fb4DurfrF26rdEKMghR+1nBtEh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nP6o2FWi7NnVqi/LSZ0G9gjooLmVvauG9UZUAewo0TS9LDrve3EnLniiXal55XDAICm9+9Ydc+FMBpFJiLoivt58vU+iSgFJbDiTSwQtNbztOSHGW3Pzwht/udU5+KHvqrVhbr9QlAiNG2haMFbs3Jt5jRDeOZTAb2Z4AOkx9Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wGh4HOXk; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539fe02c386so2080015e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 10:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730396832; x=1731001632; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=icT0Jwpo8GGddZPXkZjIKzOMTai62xp7VfV8yD5nylk=;
        b=wGh4HOXkCu1+o9YkFCfVlb8iANFgw1xutulXFRDEberquzBUP1LDXIDwlBKCU1g/Co
         66TlMA8bAYxNPp0p4Yk4yDHkTCmPOCmYpxjeMaD1rIPsKRGi9KpVr2h1PXml4Bo8XsvT
         mnv6NHe3Ws3nKMmlUYRubo3RAbYpb+r9g+ZfwHQDNMkLUXWz0r/7QtKW+HZDwJgpYfy5
         VevOA+mtmzPtfL5xWMrYLyRNclu6BrAf6hQQe8if3OZtqbQF0/MG1Ty8/P5DbFkroJwJ
         igaC+JuQiXyvDW8Jm+MTb4pUFsxKvgg+P/+x2u1U0OFaMfGeQ0qYshk9Ewsn3KjGioib
         O7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730396832; x=1731001632;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=icT0Jwpo8GGddZPXkZjIKzOMTai62xp7VfV8yD5nylk=;
        b=nnoYKMQg+s8ImyQAWLcu24YwwHcR7947nnegJ65v43gr9TkVANReYjXxTy7zGejyys
         AADxfvMzz2/fkj969znfEIeKwXLXLfoK6mF0Sw/4zf+WG5t6tmsObZTbCakaCCxcWruB
         Nk3HYzCz+wvEHQxt2Ex9J6FVDbruWg49/d3mtEu07toGcslUHWEj+melwywKu50elQbn
         NLo1Bi4vvw5VG5NmNP5vIh0aOo9mz0aNBFydrNk5Wh2sBppoUZg7QAJOH8z3SMrlaZKs
         6bVOck892uUmKXYEGwWN1/ClB7lme3xFGgv0viIKxGwPW6gu1Bfb0Y+ouJmDmas97V2D
         Y2gw==
X-Forwarded-Encrypted: i=1; AJvYcCWYfs2k9gc6AVk+EyaYJNJXXn205ZzvaTJb5FWp4/u02VZQ950uyvJBQlNomm2EDdsKqIjRaD4w2cxJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzghg8ly8Y0mJRriSVA2stNuMQI8csiH31ggVvq89qWHVJpqJfz
	LgLJiDjGyBrm7fE84bSDZXODhyFFNmQW4w3wYAYvtswPt6YkFZ09WiNvsf2XltQ=
X-Google-Smtp-Source: AGHT+IEjo7YeCGMc9+HFLWiOPZE+phU9MZtgtYpYPR3hQQmX7N1+hAOUoR8z5B0maKvphxFM4B9a5A==
X-Received: by 2002:a05:6512:3f12:b0:539:fd1b:bb0c with SMTP id 2adb3069b0e04-53d65d96dcfmr304797e87.11.1730396831927;
        Thu, 31 Oct 2024 10:47:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc9c133sm280042e87.100.2024.10.31.10.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 10:47:11 -0700 (PDT)
Date: Thu, 31 Oct 2024 19:47:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>, Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH v2 04/15] pinctrl: qcom: spmi-mpp: Add PM8937 compatible
Message-ID: <ucmcr4pbmmgkuaxvrky5376jtsxu5zejuo6tp3z5l4zbm43hok@a6fzyhvjxhaz>
References: <20241031-msm8917-v2-0-8a075faa89b1@mainlining.org>
 <20241031-msm8917-v2-4-8a075faa89b1@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241031-msm8917-v2-4-8a075faa89b1@mainlining.org>

On Thu, Oct 31, 2024 at 02:19:45AM +0100, Barnab�s Cz�m�n wrote:
> The PM8937 provides 4 MPPs.
> Add a compatible to support them.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Barnab�s Cz�m�n <barnabas.czeman@mainlining.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-mpp.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

