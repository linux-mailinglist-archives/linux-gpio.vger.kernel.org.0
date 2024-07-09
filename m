Return-Path: <linux-gpio+bounces-8111-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D601792B204
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 10:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9281E280DC7
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 08:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9F1152537;
	Tue,  9 Jul 2024 08:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yfGq3CPB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D08E14D6F6
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jul 2024 08:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720513357; cv=none; b=VNRSdAA0hmbmhqoFQiCi+bjlGeVCorvvdaPKljkSLBMs+Zb0RfU+RzVG92vEXZ42YJFPS12WHm5uMG74uYdcgePOKV0emVThWLvOG+Ki522PTgzhovBVWuQpYZK2nqcBVNVUyfJxwQGzkPbXIHNZJhKcr9Hwz6mRkLnBMkpD/qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720513357; c=relaxed/simple;
	bh=pdKj5Sl+RDmoDv7MTpHjK15cyv/vvLz5hzJEr5LKyD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EhisbSl5gt8Wcl0dLXMcG27mXmN9KPvasWDefXUDjS9Z1caRr9l2CdxM0XuwSMm1BAxu5AhRqMm9J9DzUwBBds0Gr6pesRWf0lY/ac9qFNndGxiztzqopHrRi1Q5kydJ3XaJKYe/WU0xUVMh6rG7kYpwZ3Q2Mfy6WM2eO0cQPVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yfGq3CPB; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-75cda3719efso2347414a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jul 2024 01:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720513355; x=1721118155; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6A2sGpkLoR44q9qvpfYuhNZHWZy20BYVikC6QQBRMWc=;
        b=yfGq3CPBvERSL6WW76zovqy9U6lxgVcOm2Y1DixnerkqlQk5UACkjCJCTitulQkFPv
         xA1RWtW8wmDiS0h8mk64oqjMp+759TS+H01WHET9h7qBHSW/fysmiv29vLnpXdbiJqhi
         cq98FIncWTSdNveF/hARi2QdCcMBlLd1GdZ8pEzHb3qQoDrqhsxie3kFB1TyVYjw/qQO
         3ZRUInHlkFToF7DqlDuoWnRlahn8iw1I4T+mantPjLJGQs9B6rcdn4fm/09CjMklD7Lx
         xqzRRkHY6AuCGEdfFmXkrpXBU9L2wmtsygyo9UiKVQ9Ux7/AjNtGXCL7rFQyj7ckFxqd
         NySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720513355; x=1721118155;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6A2sGpkLoR44q9qvpfYuhNZHWZy20BYVikC6QQBRMWc=;
        b=NvldHOgRh2FlEI08vOgGo2BeBpAzGg5wVzhaJ+nTy6Asi7SJwQLyYClbqWYHgN0RtT
         1PdQfscPp78cgLeH0wT0gSZlPalqgQAedER49LIWl1Fusk2HTNSQXAGQIpM+Hb22HpLa
         r9y9wJ5msYcDTehs1tgItInfH8O/D5pTmDu9c29+HIG4o9fz7UdJSt56FoLy90e7OcWt
         fScHB6Ym3fy1uk8uMs8pLQRPY3QKlgUY8/B6tklox2TmWVvR3WWxvD0mie7ldWrjVZN3
         d31VgwCwrIOyUxF0J36T5lb0F80ChK2r5SkGuFMOH5/f+6sr7bfFmOSPs49oDNnyxKOa
         sjBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnvmOXwsPDIiK1V7C/T0quhNlM/LhytPw9H7vO1nwId3CSsOzlR9Cbhoqnkmg546hK8sl2owa2KRkF+dO976CVweipwFVxw20V1w==
X-Gm-Message-State: AOJu0Yy62ejFFrlZ78CB6cVz/AxMvZL5YCWaegpH+kYYZCoAN5qGXmTo
	PEeWJVWXS5QLAYwSxMIzGc7RNexWE5kEs2caSzyHT4QrC26OMTlb0DxwDS2RSUo=
X-Google-Smtp-Source: AGHT+IF+2oTYitTG2y/n1s9GD0vzoYrzfBt3TQ/PpdeTquco5XIzyIuGebiVTZPAncjqLsKvlaplYQ==
X-Received: by 2002:a05:6a20:7485:b0:1c2:97cd:94d8 with SMTP id adf61e73a8af0-1c298223d92mr1831621637.20.1720513355542;
        Tue, 09 Jul 2024 01:22:35 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99a9977cfsm9387109a91.34.2024.07.09.01.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 01:22:34 -0700 (PDT)
Date: Tue, 9 Jul 2024 13:52:32 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Erik Schilling <erik.schilling@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: Re: [libgpiod][PATCH] doc: fix sphinx config for rtd
Message-ID: <20240709082232.bf4qvzo6oswgsfad@vireshk-i7>
References: <20240705021750.43197-1-warthog618@gmail.com>
 <172016528819.6599.11422057058966562764.b4-ty@linaro.org>
 <20240706025456.GA13007@rigel>
 <CAMRc=MeUmk5Q_9whx-fHFqRL3Z_wp0L66_kErnq1J6CGotsYJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeUmk5Q_9whx-fHFqRL3Z_wp0L66_kErnq1J6CGotsYJw@mail.gmail.com>

+Erik,

On 08-07-24, 13:48, Bartosz Golaszewski wrote:
> On Sat, Jul 6, 2024 at 4:55 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, Jul 05, 2024 at 09:41:31AM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > >
> > > On Fri, 05 Jul 2024 10:17:50 +0800, Kent Gibson wrote:
> > > > Generating the latest documentation on readthedocs is broken as the
> > > > index.html generated by Doxygen is now being overwritten by one
> > > > generated by Sphinx.
> > > >
> > > > Make Sphinx generate a differently named root page that does not
> > > > conflict with the index.html generated by Doxygen.
> > > >
> > > > [...]
> > >
> > > Applied, thanks!
> > >
> > > [1/1] doc: fix sphinx config for rtd
> > >       commit: 824c1f39347c2ef46919dfc45e8247441b908827
> > >
> >
> > Btw, I ran across this while updating RTD to v2.1 - their default build
> > config has changed since I last updated, so that didn't go as smoothly
> > as I had anticipated (the plan was to switch the branch the generation
> > uses from my fork to your github repo, but now that can wait til v2.2).
> >
> > I am also looking at reworking the documentation to use Sphinx/Breathe
> > to generate the html from the xml that Doxygen generates, and
> > incorporting documentation for the Python bindings, but looking is
> > about as far as I've gotten so far.
> 
> YES please! We really need this and I've had it on my TODO list for
> far too long.
> 
> >
> > Not sure what to do about the Rust bindings.  I was assuming I could
> > just link to docs.rs, but the build there[1] is broken.
> > Can we fix that?
> >
> 
> I don't know. Viresh?

Erik, since you did the whole pkg manager thing (where it seems to be
failing right now), can you take a look at this please ?

> > [1] https://docs.rs/crate/libgpiod/latest

-- 
viresh

