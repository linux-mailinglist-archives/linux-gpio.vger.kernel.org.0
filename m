Return-Path: <linux-gpio+bounces-4813-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0A1891160
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 03:10:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BA711C2914E
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 02:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB901C691;
	Fri, 29 Mar 2024 02:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DejxMVzN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570963FE20
	for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 02:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711677998; cv=none; b=C2QP9E8uJrjCzzlGTSgIoz27C2GxSZ6/o1Rxq4ClytzZK7JPslhB0R42vqqjuTdeH88G221UdGaucuvUEDjdTFKCqHD4j+HzBj3yrD98PhVODDiOiwOtpuCzWFjEtZYd2QueOrNRBBJfWK0anQCBAFXrngG/5WEozqsTzaCEFII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711677998; c=relaxed/simple;
	bh=0AYllOusSnT33d/tw0BPTlXLGvcvdH2I+47ZEnwDj7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRhadKZLqB/FwnjI78JGy1oR6ahUjpYX4hvmhMnCeRNPTGIX657x382JR27Pk6vzE8IRC0Pozs9qhQZ6UhMQPfqZZBnC1sogsqH99Bu0wTngFBumtkLPZs1tlPUfjivfol3/fwll19lR0jAHawDXbz6GzMLHMO2LGptJo25IwBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DejxMVzN; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-341cf77b86dso1413882f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 19:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711677994; x=1712282794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zfJFWUNZgSVY42VCUplAVTgRatE17x59NmVMGk31VFw=;
        b=DejxMVzNBJxBsRt4k8o0F/1y/eojbujEKq0QjZJqctP0QSrosVfNFgp4DEbLlcYZvI
         em/SY06qcj/GOlqo2GiIhYOb+0zSwnxH89iCc6JVi7UkumL+tUVhjIzEOfumkWsKenKf
         +Lv3L2EnraIOsXEftQRngfTvjlXMAja0EkNzHNTqeFpE/AOyuwurwzqC33pB2vf3BsZ+
         qLI5/w0UyKT+/MT1yeUOE56BAVLgScR/awBkY9jk+0Bq9IYlJVSlBgKaDsECz3BFb7Od
         F7j7lZ++ZxTkpyFvnPej+y2tNXFM+WHlk0ofricIWViS7FvT96T39AY6SYx5emGz8/eu
         PH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711677994; x=1712282794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfJFWUNZgSVY42VCUplAVTgRatE17x59NmVMGk31VFw=;
        b=hZ6g6ZjK2Y+EOOtsf9Do/wHKspdI1w+659wOD3MOlmW4MRWykCLBMOZ99V91rehG1L
         lXPi/JqI2RwptbL/eq4Fl2uAPUXheChXvZMdSS2JRnnLPAu1okhUCz0ZWCkvs89Fjpha
         i6aP+GxpaYO5qtnJWR4B+EcXGmZoTtlFms6qNpmnJ9Utklw0cRNrGhMBRqL6fpjyzce6
         S7vccykhDFXGlYFvBlBMvSmXu59h1HLre8Mb6uPmLe37ltDNbwWRlIMdNDJS3j88bwyN
         xZRh39G7KPhgJgHUws82JJYgikOohVGpJU5ePUJk/vzkhgSL9FjElJNx03zwmQwlv5jC
         CdYg==
X-Forwarded-Encrypted: i=1; AJvYcCUWtuy3UkbdmVmeJT+vgRkT7ivT+E6331yrAz1CV06C0gWeoEPORdAgYNDJ/rW4HeXGWhh15o/syJTFsCNjLr3PKGvRl/VQE0y2nA==
X-Gm-Message-State: AOJu0YwgEN58u47l3bi2JSGfV+JtpHKXFzBN2w5/ef8ykFrDcGOcAvtn
	kv1KeL2iskR1dsC6XMRKETpLgkeTWromYpR8W6LH8as8WGrTAKAoBUJU23yl84Q=
X-Google-Smtp-Source: AGHT+IEhd9AtyPxAuo6kY2WczpqRxei8C4f8o2ytln+tTrJnocbrb9Ib1qobwR4I4Q72q00wx/Tugw==
X-Received: by 2002:a5d:6a8b:0:b0:341:c0bd:ab51 with SMTP id s11-20020a5d6a8b000000b00341c0bdab51mr518920wru.10.1711677993793;
        Thu, 28 Mar 2024 19:06:33 -0700 (PDT)
Received: from hackbox2.linaro.org ([2a00:2381:fd67:101:f4c1:e8ff:fe8f:2fb2])
        by smtp.gmail.com with ESMTPSA id o12-20020adfa10c000000b00341bb338407sm3018121wro.99.2024.03.28.19.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 19:06:32 -0700 (PDT)
Date: Fri, 29 Mar 2024 02:06:31 +0000
From: Haojian Zhuang <haojian.zhuang@linaro.org>
To: Tony Lindgren <tony@atomide.com>
Cc: Matthijs Kooijman <matthijs@stdin.nl>, linux-gpio@vger.kernel.org
Subject: Re: pinctrl: single: Cannot disable bias - PIN_CONFIG_BIAS_DISABLE
 not handled
Message-ID: <ZgYiJ5KM9pdESYKs@hackbox2.linaro.org>
References: <Zd8hYYDvvk2Q-GcG@login.tika.stderr.nl>
 <20240229073211.GB5299@atomide.com>
 <Zflxi8SCzzouP9zW@login.tika.stderr.nl>
 <20240322062419.GA5129@atomide.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322062419.GA5129@atomide.com>

On Fri, Mar 22, 2024 at 08:24:19AM +0200, Tony Lindgren wrote:
> * Matthijs Kooijman <matthijs@stdin.nl> [240319 11:05]:
> > Hi Tony,
> > 
> > > > An obvious fix for this would be to lift the handling for
> > > > PIN_CONFIG_BIAS_DISABLE out of the inner loop, running that instead of
> > > > the inner loop in that case.
> > >
> > > Maybe post a suggested patch for Haojian to look at?
> > 
> > I've created a patch (will send in a followup) to do exactly this.
> 
> OK great thanks!
> 
> > I've compile-tested it but have not been able to runtime test it (I
> > managed to compile and run a mainline kernel for the BBB, but ran into
> > problems setting up the bias control devicetree). For now, I'll just
> > leave the patch here for review, maybe I'll find some time also runtime
> > test it in the future (but likely not).
> 
> OK
> 
> Regards,
> 
> Tony

Thanks. I'm fine on this patch.

Best Regards
Haojian

