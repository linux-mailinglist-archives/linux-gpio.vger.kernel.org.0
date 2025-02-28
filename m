Return-Path: <linux-gpio+bounces-16815-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A6DA49A75
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 14:23:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A33D23BCBC2
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 13:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B20F26D5BF;
	Fri, 28 Feb 2025 13:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2TW0NcZu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE02026B95B
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 13:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740748992; cv=none; b=FNiQBtCAHMS12jLRDoVUj7WixrYNDYR0J9PccNJumFjnc/4/p5Lw3cgEbEpRsANEfdYeKjapuutGMaDVimGbr3cw2iD/K+qs4pU78R+MqPPqCczoEriIXqXFf1G+BxYJlZqvKPeURiUOwAyASzafpw78hZOGUuAIJCyz4qJ4JyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740748992; c=relaxed/simple;
	bh=If0d7NN5kjSN572AyOMZb3XK1hJUdzqjfhdjSdkdsgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PO4kjcUYCfXIOx3B2RSfYDZIngPjivdcr8lTsQnVS+NKwMQF8hSHdv38S2JSF0UIZCt3KRSXA0JVkodEOkrh5d1kIAtCZT03HOejJQLdJsyWGcSjd5Ep8UwaT4i1GNN7WLhvi+lZFTCEdmEYl3KkRzWZJrhQFVoFdLcDE9KFIfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2TW0NcZu; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5495078cd59so644316e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 05:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740748988; x=1741353788; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=If0d7NN5kjSN572AyOMZb3XK1hJUdzqjfhdjSdkdsgM=;
        b=2TW0NcZuAWJxQmu68kmnIzrrXB+pHlRyO0PLzm24ctmmY7DGQhmUVbWUzrxBe5YSH0
         D+PzGNXnaURxrNkk8DXwV/I1o11ikZJXdW/7gtLAWGHqPn8/33expOgp+ie5v36rjqsK
         ByhJi/2ojsMuoiINEVCRRaPHxwJRNJz1ZaVVCjkiCG6PQIQ1sNN8g54cLGE+eQwIEFpp
         nTid2Wet2L9PmFwu20lfqEVxXzv/CmxGxysSDjdJGJrEdNG1t5nnrCeD9rtb+c98cup0
         JA/YtPsCCieYIIdtHELTeg731cIaDNfUOvHWPvRBq1vmEpP53EpnXwJYeTm5/S3Puk0F
         /TGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740748988; x=1741353788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=If0d7NN5kjSN572AyOMZb3XK1hJUdzqjfhdjSdkdsgM=;
        b=pi7nfr5/o1h6Gc9VC3AvwSIg+vN6xlyZkxboaIfLeI4Vz2U9uPZQgyu6E4I7pdqdST
         W0AMsbvhiIY98NnaMzAMLW2Qk5D1o4TptgCe/h070iEpOR3Ec4qfhkbRXK4WiM8I6yYb
         bWUCC5x4NXN63rZhRzV/XkIIHF3rmt1ws5noL1RUR7xOyLHoXIT3LvOUx7/UmA9mxCeG
         el9FFo98r+t84lSm/baXrA5qUHyIcjFWrbD7qMD/atjtGpxBVK0aFKovy9ugQEUkHjvw
         FNbUsXCXtZDwTyTuhLPN+tb27+PXGO0CG0MfqRDE0CTTDXWfB3BuJ4WKFXKSPALmR9/A
         jHOw==
X-Gm-Message-State: AOJu0YwfF83UkADR94gZ/pIK9rEqT4OgJweb91aZUejIxrDdUQWDgHFm
	IW/jDl4qUMd97nLgXe2IfUwFu2wfQAX2pLK4ArcNHv9NQbg2yZkbW0d/0/vs506uWo8S/7Ajhe3
	1RverU9NU6LjTJyfNyLMPsOBMN5RiX1equPRAHA==
X-Gm-Gg: ASbGnctpVPR+j3gdLhvtOTKq1FdeF1oa5rRqTVUQS0ayIzzfNRaRSZJ4ReJXbCP/YCp
	vz62EUc3Ail1f9K1i2rTDQFwolPnDxtrXzJs0AMDRugKailSmc5m7PlKbikKtTJsoFK+e2zUK37
	1+OuiwUBL2WfQxOs4G9dMaBKHFL7IVgGd2scmIuNg=
X-Google-Smtp-Source: AGHT+IGZT0/tQv+gIzMhv0A9Hxob+1QwbeITp1xdVCZxlswN+zg7+qkX7IhJoIdsa7VpquKEjHURQxjaCYXSU7nfhkI=
X-Received: by 2002:a05:6512:3406:b0:545:271d:f8e with SMTP id
 2adb3069b0e04-5494c3317c9mr1180931e87.29.1740748987626; Fri, 28 Feb 2025
 05:23:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4af4f6c5-d7da-4735-9ef5-ee3c34f7eae6@cyberdanube.com>
In-Reply-To: <4af4f6c5-d7da-4735-9ef5-ee3c34f7eae6@cyberdanube.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Feb 2025 14:22:55 +0100
X-Gm-Features: AQ5f1JqCZphAcLC2uj6b2ZsE5pirTL_Hr9RgFe3TDYQq803J7XXBZBD9cLOit4w
Message-ID: <CAMRc=Mes3EmqfPtMBNZfTPV2cpyfsH13hS4bad5AwgTUbdVCPQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: added configfs option for static base
To: Sebastian Dietz <s.dietz@cyberdanube.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 1:46=E2=80=AFPM Sebastian Dietz <s.dietz@cyberdanub=
e.com> wrote:
>
> To replicate gpio mappings of systems it is sometimes needed to have
> the base at static values.
>

Can you give me more info on why you'd need that? Static base is
largely a legacy and deprecated feature, there's ongoing effort to
remove it from the kernel.

> base is treated as unsigned as there doesn't happen to be a
> fwnode_property_read_s32().
>

Ha! That's interesting, I wonder why that is. We do have signed
variants for OF-specific properties.

Bart

