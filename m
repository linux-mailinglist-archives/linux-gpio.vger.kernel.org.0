Return-Path: <linux-gpio+bounces-6359-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F498C4E39
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 10:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92928B23EE4
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 08:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D97F208CE;
	Tue, 14 May 2024 08:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0LsCkLe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963D821364;
	Tue, 14 May 2024 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715676947; cv=none; b=EiBjMJgnTW5Mbi+k0CxQ3p1JtkAfgVZvhQKNgQ0teczH9wLPdSYRl6dhfUgWGyAdWGAXKFihveHjsx4d3nsTdd3EhzgOTCCry4DNA2eXWO0HKuugdeAE3ES2sUXnrSkiap0IEHGDKErJNXZvzhddJ2u8b3oRGHM6QEgcxqL/Obs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715676947; c=relaxed/simple;
	bh=huYfwXJGvSV/H3faeB9HxAG4/8daCo7E6SQ3NXCZ3xE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P4LKPBzoQBJRib0iowKL2QPI+ud0prQZm5Hh4lW7GmnotYiE1wHkbXVQBRISsTmiUEuHY+CQt30gP38ZpaUCMs6kIcb2Eo5EShn+N8vf1+LxWcfqVey408GSph+FznvVbtUF0y7ptgjxc8YgPnjZUHw6dz9O1v+XH6OwHycvYS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0LsCkLe; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a59ad344f7dso1081926966b.0;
        Tue, 14 May 2024 01:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715676944; x=1716281744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huYfwXJGvSV/H3faeB9HxAG4/8daCo7E6SQ3NXCZ3xE=;
        b=a0LsCkLewSOoIJp92Pc63lBWyJTTpQSEHcQo+Bem/ovTXxMSwmJ6jR/JUQ9Va1UV5G
         tiZ2jz5BUuXd9i4rysOuVidy+ldkjTKNUBE/NeU+oXbbVNPFCyj24KkbkcrY/llfO1Ns
         qTCWyUIhDt5ZRXUioIERRKws83DXLAit6Dlo78Zw6g/pol/jsrclvnA9QBW/iAc6vIwC
         tYBKFHJ2IdwzhvRTXWNEG/9O8EBt8WUQIpDn19ARnQfM5YnTkjgkhoEw7UuNSe1fqQE7
         ZqVqFTO+6HV2S0/VTZfIu0rIr9Ogtfo23dogBENFWcl8LeA+CyrWlGDC1lUbxREZqHjR
         zPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715676944; x=1716281744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huYfwXJGvSV/H3faeB9HxAG4/8daCo7E6SQ3NXCZ3xE=;
        b=mmh+BZ2JUKLjKqSvkyrSvOjHmGfqzWX7+n2xm7AEqlqakT4xz9NqHUm7K80cBDr4w9
         NRT9pmZwAx0BCZ3EL/fSPWSpFbiDv+Y5C9hRsOC4UbnLdrp5VPQZaAgztZuZICW9eYrs
         eYavEVSC0nUMhrFKIwJ5+Li1+OFRLMzAJoIXpQXuPDIL4SQZqKxwPWVW1APYRX4Fed19
         VCim0p6m85M8Rgy/pNzviRr7ceSdi5dB9/qKP6rD2ubpXejtq39sPiUf/zUyEu4ane3d
         xVFC2vlhRTAk7TxGy0Yh12wt8Q4AkgnsmmT7ZzefgykGx9GqdvExSI/biD7dAO+ksyxn
         h/rg==
X-Forwarded-Encrypted: i=1; AJvYcCUZcIzE8lQmWAaj5zJo29nJpQ/9WcanpMmAIzsn5rWngrc28DDFgUc0Lt10+/jZA+eTaFUrzkiCuRdAIcKtVhwAvcUCflnMh4KXwPx/WpfAVfNjqivCJQR0x+6BRDJUR4s6CAI/4ilIpA==
X-Gm-Message-State: AOJu0YwPdt+7yiHVK13emMEF3NlP5AF6LUHCGOLal0Xqc7vvyFgTevsO
	NCUEviVr4MsZk8he5ainzzrUtvCsm+fs5bqboCstgRkPdk8eDEqLJtur+kNjJuEy7tPhBXiAmdX
	rDcwryxt4O+RyK0wB0nMZMetuuaBy8FP2
X-Google-Smtp-Source: AGHT+IHpz+6NVOJTXRAhYvT5ZODmxpGglgA4ik9Fj32/EZPZJH8qVctUKte+eNMCeb6u7NvX/drOKeCqDXcg6K+ICHw=
X-Received: by 2002:a17:906:d159:b0:a59:a977:a15b with SMTP id
 a640c23a62f3a-a5a2d680d23mr720745066b.68.1715676943955; Tue, 14 May 2024
 01:55:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231219125350.4031370-1-patrick.rudolph@9elements.com>
 <ZkL2Sdf0NcqaZRZ4@surfacebook.localdomain> <CACRpkdbUye6RhbRNGn6sapARwVUyi5hKS-5VEVBr6ZR6W_KdQw@mail.gmail.com>
 <CALNFmy33wMHBcoU9ei0vVsn0gUM7-0jdkDDq_Loa3=mMWXiWcw@mail.gmail.com> <CACRpkdZhY_Yz2jHGXWO5_t8Qdey8me0Gytds7V64GYOFoEC2Dg@mail.gmail.com>
In-Reply-To: <CACRpkdZhY_Yz2jHGXWO5_t8Qdey8me0Gytds7V64GYOFoEC2Dg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 May 2024 11:55:06 +0300
Message-ID: <CAHp75VfA8G6KyhD5_HDyKWp5AdpsnnQ27gzTDRRjDRCVXkT-ag@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: cy8c95x0: Cache muxed registers
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>, Mark Brown <broonie@kernel.org>, 
	naresh.solanki@9elements.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 11:51=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> On Tue, May 14, 2024 at 10:39=E2=80=AFAM Patrick Rudolph
> <patrick.rudolph@9elements.com> wrote:
>
> > Do you have an example where muxed registers are used in a regmap?
> > Is there some documentation available explaining the existing
> > mechanism? I'm not aware of anything.
>
> The regmap is sadly undocumented I have had it on my list for a long
> time to document this gem, but I never find the time.
>
> You have to mark registers that cannot be cached as volatile, then
> enable caching in the regmap with e.g. .cache_type =3D REGCACHE_FLAT
> in the regmap config, then it pretty much caches itself.
> <linux/regmap.h> has some cache maintenance functions if you
> run into corner cases.
>
> (Mark will correct me if I say something wrong...)

It's about introducing pages of virtual registers (from regmap p.o.v.)
to access the banks of selectable registers. The cache most likely
will be the same, i.e. MAPPLE_TREE.

--=20
With Best Regards,
Andy Shevchenko

