Return-Path: <linux-gpio+bounces-15128-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4ADA23F32
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jan 2025 15:36:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61F863A4422
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jan 2025 14:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64E51DED74;
	Fri, 31 Jan 2025 14:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="TC3vPUxc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7851C878A
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jan 2025 14:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738334199; cv=none; b=IZZkFkdQENJW2Qb3bZdp8psj63fdV9cKCW3HlbtwSJTvjX9a7kNEyV1KE9VAyA2QeqEPlvstxHw7FS2FjoS0tT+Gp3HD3XP0Gufp0qmPb4lYj9kwIQNqharzI4NGugtb3n1qukCcm/gdyFqtPhDaeinHQA/16LS1m92uQ+UArmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738334199; c=relaxed/simple;
	bh=tM9vE1hvQFxGftbHNk++j2LOyxmGvLANGlaA8puxZeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CWlYvaOg2EsL0rbyq+VSGlexb8bqHH1IyHA4c6vJH+4a3phVvL+ONX5sET8wGFeJyns70BznoXjXFTspcIWzydwZSs0ka2Y+LzZKgmqfe2zPHR6C2TrbIughQso2ocXxostHDl0tY1aXTrAyyOSjyKUq7S1EyecqeudqI5CEFfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=TC3vPUxc; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CF16C3F291
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jan 2025 14:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738334193;
	bh=GgR4Fa5C21+4PsGqKpSTdU+09I4aUV4hzbnQq2b5Hjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=TC3vPUxcnxkmTGpjzf9kA0AFXaP5FEhjR/AMAIujxv1jT+TG1iO+OPV6LVey28jm6
	 OMXiNFnF8kk7EgZfzD8bEzYBPo8qjITiPldgPG0QHKiOi2kO59YMRvR/I6xjye51GB
	 xU+Pxz+FcCVpOMnGN0W4jkRxvQv9rpTMXcaTSrJW0Dm4t7dPLmQzGEaOtXbHVNco/a
	 tPbwoDemw4s4u3COfj377wM4Dn9qgnMDfav+Yt9G/aX+Dxf6CEJy6yNS3dtI2Q09ZU
	 KU/Re07OLh1NTke3/O4KbN7npx7kfL1m4bngqlLMuE04fTa+zqMyWgmSiKQHujiEEi
	 DoAkxmB1wQA8Q==
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ee5668e09bso4183999a91.3
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jan 2025 06:36:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738334191; x=1738938991;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GgR4Fa5C21+4PsGqKpSTdU+09I4aUV4hzbnQq2b5Hjw=;
        b=wHFKpZ/5CnFaXYqlTBPmm8DxX50mZkvDnU3DLnFjmX7v48lVEEhIFAXkPMsC7PTMlS
         aStSEn9JS+CQuCzfW9NgRxHciF6CbgQSEq5Y4jsIahy8csi7d9mTSwc1EIOEcSaMljUB
         mmJYHTrupJUoJUJI6WD/SemFKf+0IcKRxL1rKlK7UVgvdOwwws1N2CvNOCIZMnmMQoXw
         2qYeiAosxCQdE0KjCQh78qwdYmqlEMbHs+wOkzFT1wF1qb2yZZnOz+kDw2+UjNz/znKt
         coyOV9SQ77u+oj6fVh2Fp9dLmZqtX85FF4A10I3XSaFExr26E88x3Tpxx1VFLyZB6nt/
         0l7g==
X-Gm-Message-State: AOJu0Yy+ODgm5Xxnbir+nrwKndUwnG6f5RwCUtOjSCHKfML8Z6pFu7yC
	8mgSqI7jBTtf1v6HqMiLGDOKcL9jz4WRtdFqDqOr313oLVUEAMajxJIuSytJfbp70rkDfq7/mn8
	Wp2O0kSHyN5hoYYjvhIoUFhDvH+ttZrtSps68KZgwBZX/x3xMqyjWY8Hrfd8LlsbHOdpt7Dl/1O
	Y=
X-Gm-Gg: ASbGncu/pZMIIbt+ob7j6WQpXRNFVFwitHBb+cDQe2SdM2BdFadiJpljDljOvqJHOWl
	hzVz9jJbKty8XCG9AGRi8jqT7Jcq1J74n8hWvXq8ohu8kZyII3PNdPqmicRNmRvYyNku73z+vBS
	nKof/LPpj44JnMUsd82/KgmA8jFRZufn2z966R+ySqNHencn6cxppA3KGvkQ8c5YjCdTsTiwn6A
	Z8iTi282DSjdAVQNkY0pcEQ9Njm5m9mAIcG5TGYkILYRJWguPPodFjPu2PzPeU7QZy1TPj6lNLp
	sNZTYIc=
X-Received: by 2002:a05:6a00:ac1:b0:725:f18a:da52 with SMTP id d2e1a72fcca58-72fd0bce067mr17142890b3a.4.1738334190996;
        Fri, 31 Jan 2025 06:36:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJ3NHrsSTb+l0pVV7sIQZfb9BdkAkZLFniGUqZPJU+lfTP79eq8Jv6xEPNBIF3S7kq3Zp/4g==
X-Received: by 2002:a05:6a00:ac1:b0:725:f18a:da52 with SMTP id d2e1a72fcca58-72fd0bce067mr17142836b3a.4.1738334190432;
        Fri, 31 Jan 2025 06:36:30 -0800 (PST)
Received: from localhost ([240f:74:7be:1:12a3:6433:5e8e:7cee])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6a1a773sm3378230b3a.166.2025.01.31.06.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 06:36:29 -0800 (PST)
Date: Fri, 31 Jan 2025 23:36:27 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] Introduce configfs-based interface for
 gpio-aggregator
Message-ID: <rhdrieapetwdr3z7roguf5nex3esazhygjbjx4zklkrjzqrlsv@6vc5zmk3il5e>
References: <20250129155525.663780-1-koichiro.den@canonical.com>
 <CAMRc=Mdim2aSBs+JsL8dECfG0Vvrvcq6CHaGHbBoVhNhSZn9Kg@mail.gmail.com>
 <2kz6mz6nglozgrwudkgziles4wievwfkkl2oo7qyvosirchjuw@y3wfna5dsekv>
 <CAMRc=Mc3qBXaATpYRAXeHne0+mBjErivjvUe4rBEj2ksansatQ@mail.gmail.com>
 <CAMRc=Mc5WWNErJfEQ4sFRQm_+vDRMa7KBKSPSnP3W8scu4G19A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc5WWNErJfEQ4sFRQm_+vDRMa7KBKSPSnP3W8scu4G19A@mail.gmail.com>

On Thu, Jan 30, 2025 at 09:47:47PM GMT, Bartosz Golaszewski wrote:
> On Thu, Jan 30, 2025 at 7:40 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >

(Small reply to the previous comment:)
Yes, I understand your point about why you think 'num_lines' is
unnecessary. What I meant was more of a UX (User eXperience) consideration.

> > While at it: there's no reason to impose a
> > naming convention of lineX, lineY etc., the names don't matter for the
> > aggregator setup (unlike gpio-sim where they indicate the offset of
> > the line they concern).
> >
> 
> Scratch that part. There's a good reason for that - the ordering of
> lines within the aggregator. [...]

You're right, that's exactly the intention of the strict naming, 'line0',
'line1', ..., 'line<Y>'.

> [...] I'm just not sure whether we should
> impose a strict naming where - for an aggregator of 3 lines total - we
> expect there to exist groups named line0, line1 and line2 or if we
> should be more lenient and possibly sort whatever names the user
> provides alphabetically?

As Maciej pointed out:

  (https://lore.kernel.org/all/CAFGk_a0U=jSQD85UKC1e=pSWr8W9y_MMAFyPVFOcE-fUZry7-Q@mail.gmail.com/#t)
  > [...] if free form names were for e.g. [1, 02, 10].

we would need a well-defined rule to avoid ambiguity, which could
potentially unnecessarily impose burden on users to understand how to
properly use the interface.


Regardless, the point is that we need to make it clear to users which GPIO
line a specific line<Y> of an aggregator forwards operations to. Since
requiring users to explicitly set the offset within the aggregator for each
virtual line (e.g. besides 'key'/'offset'/'name' attributes, by adding
'idx' attribute, which users would need to set explicitly) would be
cumbersome, this RFC implementation instead just makes use of directory
naming. I believe we agree on this approach (i.e., using directory naming
to establish ordering). Correct me if I'm wrong.

So, to move forward, let me outline the possible approaches we can take:

Option (a). Drop 'num_lines' attribute and:

  (a-1). Impose strict naming rule for line directories
  
         Users can only create directories with a predefined naming
	 convention. This could be 'line0', 'line1', ... 'line<Y>' (as in
	 the RFC implementation), or simply '0', '1', ..., '<Y>'.
  
  (a-2). Allow arbitrary naming for line directories

	 This would require a well-defined rule to avoid ambiguity. As
	 Maciej pointed out:

         (from https://lore.kernel.org/all/CAFGk_a0U=jSQD85UKC1e=pSWr8W9y_MMAFyPVFOcE-fUZry7-Q@mail.gmail.com/#t)
         > if free form names were for e.g. [1, 02, 10]

         Users would need to understand these rules, which might impose
	 unnecessary burden on users.

Option (b). Keep 'num_lines' attribute but:

    (b-1). Prohibit manual creation of line directories

	   Users would no longer run 'mkdir line0', etc. Instead, writing
	   <Y+1> (Y >= 0) to 'num_lines' would automatically set up the
	   required directories.  convention. This could be 'line0',
	   'line1', ... 'line<Y>' (as in this RFC implementation), or
	   simply '0', '1', ..., '<Y>'.

    (b-2). Keep manual 'mkdir' for each line, in the same manner as (a-1)
	   (as in the RFC implementation) or (a-2). Seems that no-one is
	   favor of this option.


    Note: (b-1) is a new idea. Considering what really needs to be
    configured by users, this could be the least burdensome and simplest,
    especially when configuring many lines. I'm including it here for
    broader discussion.

Personally, now I'm inclined towards (a-1) with the simplest naming scheme:
non-zero-padded integers ('./0', './1', './2', ..., './<Y>'). Or even (b-1).

Let me know your thoughts.

Thanks.

-Koichiro

> 
> Bart

