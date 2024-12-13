Return-Path: <linux-gpio+bounces-13848-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 587569F01B4
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 02:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C4C61881FF4
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 01:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30FF78BEC;
	Fri, 13 Dec 2024 01:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MR76rbOP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E34625771;
	Fri, 13 Dec 2024 01:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734052402; cv=none; b=a/mON3jjJs87wugyeilDXf746Kd6TgTL4fd7epPVnwBRrwA3OG3gR7pGm8tel8pHnGZKV+supHZQiVqQFWnsJ0LaS4XcM58W2gjhBQysxrMSwxHjg1omOw7hVnqQAoN677Sbfs11TT2TtPjqkx+bRf/P5OeYx3rkO0SZOYhRd7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734052402; c=relaxed/simple;
	bh=gSvmkpyWtAyUmYN6pUvEjdHyE3kqZJ2RNKbsQcSM/EM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FFQaHBEptNy63pQzihtIw13hEZeYE9ynr597SzltwGK8fkTehXz6wyei3zV7szRFUlMuSLvr4xG7mKyxbOXMmB6Ux5+b04+zaIDRCIEQhsmWb2+wPjtXwK8/8MzkRiyHEVEjfqZkFRfxL4nyZPSJR/OFqm8T2qsfDZn74T49Kaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MR76rbOP; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5cecbddb574so2100245a12.1;
        Thu, 12 Dec 2024 17:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734052399; x=1734657199; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=intg7CPV5lNN2upqT1uQ/sZ0DfNdXfMH+V8v11jVfBs=;
        b=MR76rbOPOtYBiVLFG8F1Z2pod1IK+aAv4zzSuR5FkBL7qoZVK2bzIK7kv2e60G6d3t
         ba2cNu5PvPcJ4e/NUWz9TS5dh8weRSQ5SPqlSEJs2Nf8FTA8EeIt/3BvdWVt/Jz5kH9V
         90T9YfYb166NXrjLRaxltByaCVFGRKwJL5Gm14MOHuT1W7ITsMSDKnRtVgp8zWaWpmoD
         9aDGS2DUb+YHUpzTQZ8M8FPDmd6vxna82bDaO5adCR3ZMLKDpSY4cEMdx1A8oj+SQSiO
         hxXkd+ZOYOIFtT3dWzYtwjxp0LuzFSH4Jg34oYXDdzI6yd+PMSt95fT6Es6gWWSU3k2H
         theA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734052399; x=1734657199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=intg7CPV5lNN2upqT1uQ/sZ0DfNdXfMH+V8v11jVfBs=;
        b=QXjRo4lkAHHtaeDUI6TpKuHxKws0oL8I++hfnH+MPSluP0ZYNcmGZz85diB3jx8j+a
         GD4IcsousglAKi/+EUynAxJhg4iGSa0Wpb8wWwuw7blzqD+AC2x+PTXA/Ae5hYqsvNcD
         J1BIREmwr2WuOQOoWOxii7pKWUbhjpsbjAfdsBD/5FpPQ6uvtDIWZNsBUPTDSPMhBvN8
         znmFyizIEimAPOkYZ4a92JBnihmC5R+ekw6xwHgLIgXmM58WvVZYJZylM9f5EhM/2kFQ
         XbIw4gtQnh+lVJ9xqzpyNzQSneEkG5zlFe7tLjjXFWHEIRxBiFUCahP8ELhCjVMt5dR7
         P4Og==
X-Forwarded-Encrypted: i=1; AJvYcCV0HInvpcJK7p8/V5SAck8Vke1D6zLzM9KgmJAVRUVThOnZrMtwNqLAj0qbRoKalqylQhZJ90djcJDH@vger.kernel.org, AJvYcCVv1Ei1t7pQpTNRp+hrfqr7/9aUOP9O0TgTU3ABFhEfuT7gTRSJtBIIIxXEbcvaVemAxwMrReEJy8NC55pP@vger.kernel.org
X-Gm-Message-State: AOJu0YyhwrEFyfjyop0u3NRJtE2VkWgjep7KmODH04Q8JKS2IZDt6csb
	LW9kUOxCdIkv4YgJtaiipNiK9y46fK3JIZ4faOG8CxqClL8/RJkDsc0ECdUQZIjEWBH9ar/ohUh
	2TO0ioo/BIM5JDj9gd0ghQERN+GU=
X-Gm-Gg: ASbGnct5bZGVTKlMPE+svkeq7jwCGCnPGAUU4d7ZkoNp16HPuGCS7NINeVV0u/3gPqA
	42x7gjsVWVJ7ehm8B4ec+jPHFo39aYCUuRHBYzxlrA8G5Dt3oB8WeLvV9RxwE8ugB9tPFug==
X-Google-Smtp-Source: AGHT+IHJz6/L7nDklgKHeOu8YYD2uzG3zcykfx1TYlduVMTtvi/o/gN9R7X66CTA1wTAxqWAB9Av95x4knxXTSW55Os=
X-Received: by 2002:a05:6402:50c9:b0:5d0:d1e0:8fb2 with SMTP id
 4fb4d7f45d1cf-5d63c314efbmr468103a12.11.1734052398528; Thu, 12 Dec 2024
 17:13:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206214315.3385033-1-zmw12306@gmail.com> <9830993d-943b-4079-b31d-7c77ee83d306@denx.de>
In-Reply-To: <9830993d-943b-4079-b31d-7c77ee83d306@denx.de>
From: Mingwei Zheng <zmw12306@gmail.com>
Date: Thu, 12 Dec 2024 20:13:07 -0500
Message-ID: <CAN4iqtRk4g2q-1c3eTjELeKTTtfcV-MU-_36QkRa76+dsE4y1A@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: stm32: Add check for clk_enable()
To: Marek Vasut <marex@denx.de>
Cc: linus.walleij@linaro.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, make24@iscas.ac.cn, peng.fan@nxp.com, 
	fabien.dessenne@foss.st.com, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Sat, Dec 7, 2024 at 7:59=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> On 12/6/24 10:43 PM, Mingwei Zheng wrote:
>
> [...]
>
> > @@ -1646,8 +1645,8 @@ int stm32_pctl_probe(struct platform_device *pdev=
)
> >               if (ret) {
> >                       fwnode_handle_put(child);
> >
> > -                     for (i =3D 0; i < pctl->nbanks; i++)
> > -                             clk_disable_unprepare(pctl->banks[i].clk)=
;
> > +                     clk_bulk_disable(pctl->nbanks, pctl->clks);
> > +                     clk_bulk_unprepare(pctl->nbanks, pctl->clks);
>
> Use clk_bulk_disable_unprepare()
>
> include/linux/clk.h:static inline void clk_bulk_disable_unprepare(int
> num_clks,

Thanks! We used clk_bulk_disable_unprepare() in the patch v4.

Best,
Mingwei

>
> It looks pretty good otherwise, thanks !

