Return-Path: <linux-gpio+bounces-6885-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEF28D3E91
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 20:53:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B3351F24C38
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 18:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CE131C2300;
	Wed, 29 May 2024 18:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zM9fjI1P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742FA15B552
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717008775; cv=none; b=EFsGRY6ny8eGjmghyu28NUksld2aMMXF7mZ7KXROIG3ImUvLnxGrAGMVPZnK+ademSvVmw+TSQmHJVxggVB1CblF0DG2dQSgTdaFHdp3bmFFdkCwnHz4q1B2g4SADuD4eimt3ip2ggL4zvtTERFbtJTtvXyDJBS2LfFonTq9KOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717008775; c=relaxed/simple;
	bh=VCyLXfQw+vODJ+gWUnxnJTmwZOqAzSvyZikbefhPOtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MXXXCQ5C5ReTkiP/kb73wRxr6VeH92diXV0sf1SJPOIXK9Edq82CTVPamYz8tAYE92LxfbzopAnavTx+hTQcth5yW8eR/trK52cxGCDZDGFGU9OlDfnaWWWP/qngL62jlyGc3u3xX1SH+L6if/9Pm+r8w5VI8QXvXa2MTMpxnHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zM9fjI1P; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42121d28664so306195e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 11:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717008772; x=1717613572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VCyLXfQw+vODJ+gWUnxnJTmwZOqAzSvyZikbefhPOtA=;
        b=zM9fjI1PJgVf3I5U58hFLJCvNWRJPeAU3ubFCxPJ/C9i/YmkT9YCRB3CyX8sJWXFwt
         7PhBoBOIT6GLphMoAKOcmOJ4kyREu4XIDyZJeiHB6T233Cv/6fQHvH1iFc4u7kLmyuwH
         Sc+VWcZxbgT7cNajydCbpt//Z35CXhMcVsesb0wRJi/keZ8Nq3WJkjjvYk703g3JHrtK
         7augOOp21v0kxpHbqJjMJ/zDJNIcbD4+Ck+f4TYhpF3/VXDeLIS3IWmtnV++c7qAsE1Z
         eGw7UsXgVpAfcqpMFIoTwMqp1CbWZxxKWU/xi9P5b5KkBpavQkpF7KhlW6ZZUZfXidZJ
         xJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717008772; x=1717613572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCyLXfQw+vODJ+gWUnxnJTmwZOqAzSvyZikbefhPOtA=;
        b=TzkrHknpkifBEZETnrOAcu9LV3SA1P4z76h7rNT8LtrBHRwCmI9O0pFM62WVYmcLsQ
         9lGZ4ncfOgpQ6XQiKyB8Hzt+OZ99E6VUOuWW+pLLhGMNOsMF/sgpYvXK3VA3YO3HyziF
         JQFPHTiAc8NePdkiy/4yLi3K00DbDt9NtiEMa06EIEzmTlFJSa/2Z7KtZtDjeHrW99VL
         tIWowj8PVio/WdVAQv8BkSHTL/31SRR0GMqCzwjLaDt7ndM8wP5YyI04Fz5reN2Zjm5S
         E7rrtsZeok4xIXcCex/uqeq3lBFSWFx7QtrIjwcHlG253MENOfsElb8KT/ddjyTUB45v
         AKjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqQ40XKVKM6flNNpI0K3dVE/BMUBhV3tJhVfbGJNNssr1Z3tcPYebtiVZYpEbl0ZnbCFjnHpAVIqj1XblvtAAt3d/uMZNqSx8COg==
X-Gm-Message-State: AOJu0Yy/BAKP9V0C0VlhdNzPi+y8LwavjnxfzCfVvZ6e9aQ6RTBjPSmD
	O8wmqXHToHfuWiVqYMJVv098yYfFy6b9imiSD88RfySH7y+QMopL/mS/0WFQveQ=
X-Google-Smtp-Source: AGHT+IFYV8lOdAq8BVnBAdwANSNE1at77ft2iuhi77Gbpa36U2AS+eGe4gpkadqc9c7yNfvtjizhyQ==
X-Received: by 2002:a05:600c:4ecd:b0:420:1fd2:e611 with SMTP id 5b1f17b1804b1-421279294dcmr155055e9.27.1717008771805;
        Wed, 29 May 2024 11:52:51 -0700 (PDT)
Received: from [192.168.0.31] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-356c8daef27sm13465928f8f.115.2024.05.29.11.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 11:52:51 -0700 (PDT)
Message-ID: <6caa0d27-3abf-4198-97a9-42b0e564bbba@linaro.org>
Date: Wed, 29 May 2024 19:52:48 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] mfd: pm8008: deassert reset on probe
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Das Srinagesh <quic_gurus@quicinc.com>,
 Satya Priya <quic_c_skakit@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-4-johan+linaro@kernel.org>
 <4468becb-dc03-4832-aa03-5f597023fcb2@linaro.org>
 <ZjyX6iBqc50ic_oI@hovoldconsulting.com>
 <ZldU_LqjkU-4uphO@hovoldconsulting.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ZldU_LqjkU-4uphO@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/05/2024 17:17, Johan Hovold wrote:
> The irqchip registration will also fail if there's no from reply from
> this address.

That's acceptable too.

---
bod

