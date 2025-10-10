Return-Path: <linux-gpio+bounces-26961-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0812BCC204
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 10:27:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2D91189201E
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 08:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B473A25EF90;
	Fri, 10 Oct 2025 08:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSADIlDJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E0125BF13
	for <linux-gpio@vger.kernel.org>; Fri, 10 Oct 2025 08:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760084856; cv=none; b=O6GtijtYIrS7aBOT8cdC8QX2DdmkDhw81Il+G2QLuBGGr5ikK1gWycT5ng+VbB2q0E20AcUJZ/LpVqmlk6RkpUR5gkGVGkY/BLYAOst6gHnoWArPOWHVh4HQn1BqKwtM1yCeDzOYSMB7vkCRGPC+A7LXcO2Ink6cN4BlvqGoliM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760084856; c=relaxed/simple;
	bh=Bc+OPdWbJK0owUba+Khr9n3WegKFbUlo55fcd6DlxyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SjDLfuja5gF8EpYTpQi7n6m8pER4Ej4mlV/ldKPKuLFv3YxYxOuPoz5Y04H/glmbnNjzwqjR8uLW5vzvpHiDCZRseXZZf/Km3vQ2c8loaNv4GXXa99ePfW/n4t681Dnqxqaj6JOCQsZWDCYeK5XqaZEb0sPUkJycGSYx4DTSj9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NSADIlDJ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ee15505cdeso1599101f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Oct 2025 01:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760084853; x=1760689653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bc+OPdWbJK0owUba+Khr9n3WegKFbUlo55fcd6DlxyQ=;
        b=NSADIlDJ6dmizJ9cbFhLCbdteg7iCM7g7AW3zA387b3Jz1RDs2kHbMvkxBqJdYlToA
         o8YqlMU8p86Ol3Y1/8mAQA4wFiSkfMtF5REaoVTmnYXhrWtwCrVFnLeh4yC9Rpa/RT/j
         PJbtECmpXqATNwRWzeigFUA9WLXibLu+wn+z9PWMPV6XhMIihAUwibep+ys9mfUCMmny
         xeJnjLlSsGpOeT8sN5n4JiBPC59X02I8YjTngPTY6Lb+tQgxvlo+jkR8GXrIY6L0s1iY
         Ot5Ry/fmSrLLy+iqRvdKfxEsGJzeQ8XiHMLjq9xsNzqpcOA4SbbJr/ngDmu1pw+hbQwv
         4Kjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760084853; x=1760689653;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bc+OPdWbJK0owUba+Khr9n3WegKFbUlo55fcd6DlxyQ=;
        b=k8zOq7YZNiWa+7MK6sTESDZd9Qwr7aIzX3JAMOZHTkCn2ZUFAIpE18gHUkukp9KQG1
         LY3sxIt7MwobjI03oogbTobDvtl5SHukZ+gxRLGxVKclVe/XNsI4kUalGO0pWN2OP4GF
         DITHIZDtfEy8lZHZWJdeHg9wE/3cZTod5RJDZK7lKdQvjUdPyLFmDJ35Nx6D8YHO981I
         RfYQk7WttJYlxn4GpygXEhMFDFl5f+68+zWjMn+IVP4Hzd5wtJmsN91q3mjieRr0waU+
         J4etRNFfXrbftBojK0oJBS+TNmHPqvoFepjd3szjolU/n6fs1slDzWgAMuHAdCyJBe0r
         IN0w==
X-Gm-Message-State: AOJu0YxRBbXh5Kyv+S+z7y1w+d9bKGizktHbYV97n/fTq5k59ocMb2ba
	h8LxGx4x3DI9V7oo826azV3W5KOV7BNuEFzdw7VLH3CSsyx+dn+iV/ywHoEe1g==
X-Gm-Gg: ASbGncsuaWlzVTMgAeEIHv4gnS2naUiepgLZN5gwGbFEuET6QcsbX/eHvSa9+444fr4
	uF25zBgqVB9rrgrQCKjx1BApnWUV9vYzJDBOUcq4g9FbXEVCbKxFAs4iS+fJWyRJGBhUl7WODTY
	tvyO/dm7NpXNnEQovuWzwtq4NtymyjnoQhfBqB1quIXQ/GJ+TRPL/jKw8UmA7iC42YarfTQOFIF
	mBeIQkHKyI8L3draO0BlUwJCWsC/59ngWaTQhgJTIXZ++uz5KMVmiyEzsydBx0G5AGSdNidqplP
	86DTVF5JzmvjoEj3bE222j5m0O25kH9DKfrj70aBYG9n0B/8TBvvKDi+U3VVIkcH6kqniOKocxQ
	Fsu5ZGlfmcbIgAgLCXBNFPmdHlI4zMw4MQJI64J1tJ6QK5zxwhDmoBNIy7ZZIaq1WxRqiYBW2xq
	GmpQUnNFu3f+NH/8uPRvDtUzg+OcE+LeWtMiSyBQ==
X-Google-Smtp-Source: AGHT+IE4OYFOeFOUeL/SJc4KgTN0TBbVFULDSfyHbqmID+CsCye2eOCE6l5tIJdbjksWUl22gALd9g==
X-Received: by 2002:a05:6000:4027:b0:401:2cbf:ccad with SMTP id ffacd0b85a97d-425829e78e9mr10382089f8f.17.1760084852939;
        Fri, 10 Oct 2025 01:27:32 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f127:a901:35ca:1de4:aff:7ab6? ([2001:9e8:f127:a901:35ca:1de4:aff:7ab6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb49d159csm33647325e9.20.2025.10.10.01.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 01:27:32 -0700 (PDT)
Message-ID: <22a99be5-b0ea-4f8c-8a2c-5024507a7e32@gmail.com>
Date: Fri, 10 Oct 2025 10:27:31 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 1/2] dt-bindings: gpio: add gpio-split controller
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251009223501.570949-1-jelonek.jonas@gmail.com>
 <20251009223501.570949-2-jelonek.jonas@gmail.com>
 <3118e300-f6de-42af-bd1b-ad13dc80537d@kernel.org>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <3118e300-f6de-42af-bd1b-ad13dc80537d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

On 10.10.25 03:12, Krzysztof Kozlowski wrote:
> Instead, please fix the subsystem driver?

That's why I sent this as an RFC. I thought about this too but have no good
idea how to represent this in DT while keeping the existing bindings. 

So I just thought this small driver would be the easier way, possibly being
useful for other potential usecases.

But sure, if this is the only way to go I'll have to RFC this at the SFP
driver side asking for any ideas how this could be achieved.

> I have also doubts we actually want it in DT, because we tie the
> limitation of Linux drivers to bindings.
>
>
> Best regards,
> Krzysztof

Best regards,
Jonas

