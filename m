Return-Path: <linux-gpio+bounces-23918-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3D9B16F48
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 12:14:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51D0B5843DD
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 10:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294722BDC03;
	Thu, 31 Jul 2025 10:14:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEF4224225
	for <linux-gpio@vger.kernel.org>; Thu, 31 Jul 2025 10:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753956892; cv=none; b=urt1HRMcWFW0BxYiyvUiHNzHkHLbki12H+qtCL+xg/tdd9uceJ0PPEkwulUQfJA8EDUmVu3m6OFKNvpFR9uf6yvTEpJ2iasUvtIxflCL4Uh5yX975DZ/ZP3E59Gi70LWpwbk0eFYoD62X6VcXeCcTuyJ9YxX3LeJgSclVzdUiDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753956892; c=relaxed/simple;
	bh=pPcU9eoa7oUdr7uoyCQR6ySC0it/DhfOpKcK4wYwvJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rH/xGWOdwYxOkdjn8m9ep1viCMXe6g4834JidxVHREXxFu1ydMhufGNwcYKz/LKdSAEDqstyeeeMUmT8ok5Ql8b1fNZdXWgLqGEOMIMz73488PIGCVRWvJpm/vcqkNDzEv1MWDeGNRxTOM1IbUlMiNQ4P+JdA4FftMPP87d6VDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-87f74a28a86so529377241.2
        for <linux-gpio@vger.kernel.org>; Thu, 31 Jul 2025 03:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753956888; x=1754561688;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xBujHxL2i59uv48FbX7kqYu5U4JxIZPwN2tHCs9TWhc=;
        b=a0A3NNlZru3EYOHK934nwE8A1fjGfgFgznUypzWGnf8MEvvEB1q8xH2RwoGJwSlOcP
         OZnyFBPyislwtCMr7PsuCuXHTSAfndWbMKcPk7mXhmTWq0Ef2BAQshc6EplXCljM6Bnc
         cWn8gJ/yizmtdc+wJrTbxIKleBa1ft69tmRcpxcKKJr7wVPnEZqTfLK8IYqtvhPpC1Cb
         wt1XEBM+EoAfkc2gEudTlYU0krg/+fgxDh5X0VuD9cqA3joh5WV58Ef/K48CNxuDLK91
         cNZHme38KPT8BP+HmCIqUaiKGKNJTzH/56n5fvSeHgyr9+Gt7mShvinH0LBW6bPTojyU
         TuLg==
X-Forwarded-Encrypted: i=1; AJvYcCXwNrBvk5k7MmgVghBTw3KZiidSy1X7pzB3Nv95KcfDsM81Y2FSBRt7wfRSpYKGo6tsfBjWFzIuIDDB@vger.kernel.org
X-Gm-Message-State: AOJu0YzgPz8PZUmDkWwSdPCp5fhlSMUZL+40eh5sltCmTL+WTatNWdwd
	6J7qaJLNin8on2/jPsZG8eKXHQTVom+z4hMoiE4WRccGTAFB4lH/ArrnlvA9BFDn
X-Gm-Gg: ASbGncs8R3PzIASlPEoZE+izatTxhmL6JRjJEBFwYuL1KWmES33uFl0UxGl3F8elMA7
	pbMXH0T3aCrxFG3s5ifYIPciNKeqQsD7UE0ObUPQM7AakkqRQ8Lh47nuUg9PqomIyiB7LezsQh1
	mZyhcv307m32zocwYoKfE/5Bdx2gBCHAhZJnlWeUUr5b8kUqMOjU5cxANLqNfYfySb8dK4IH1BS
	6TJZT8tUDkb69JYEiFCxljSenZ2FR8+JrGNtCT4scgH+NqX7FAumjClqBL82wtElvibrEZ7azgD
	Y+qK56i4IS4bOqEx1ZsjIEDeOM+H/9ERn1zJ+LPeHTTR5eKpaCJ1VxbDHR0btB8TnuQdQWX5EKJ
	rNQJA+r++Gsn+3BQ6fAj+77FHiX3xz2Qhaqsbzk/52oPlWCgCqZGDDPrrYiy0nQaZ
X-Google-Smtp-Source: AGHT+IFo3Iz37BrM2bgYBc+VRh55FgUxA0F+qOyemu6y1D31sVfsKhZ1EIsxkXTlWc67tNOEoE3v3w==
X-Received: by 2002:a05:6102:f10:b0:4e7:be09:deef with SMTP id ada2fe7eead31-4fbe7f339bamr3998460137.7.1753956888555;
        Thu, 31 Jul 2025 03:14:48 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fc0d42bba7sm244671137.11.2025.07.31.03.14.47
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 03:14:48 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5390ccb30bfso573798e0c.2
        for <linux-gpio@vger.kernel.org>; Thu, 31 Jul 2025 03:14:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWX2hHmj6dHUXM3ZG9EI44CRdikG9AHTNHpO9mV/AC2Z7FXHWol9Vv05etD4/bJQAwo2WWFpGQZBfnG@vger.kernel.org
X-Received: by 2002:a05:6122:3545:b0:539:3403:7353 with SMTP id
 71dfb90a1353d-539340375f6mr1500203e0c.10.1753956887656; Thu, 31 Jul 2025
 03:14:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250731091637.595136-1-lijun01@kylinos.cn>
In-Reply-To: <20250731091637.595136-1-lijun01@kylinos.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 31 Jul 2025 12:14:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXFk+f5oxfeh2MePwpBGE2gqZXLePHzZputc6j8HwumUg@mail.gmail.com>
X-Gm-Features: Ac12FXzXvU3ZyUdg8ZJb01XbXv83Zfo2rYJzGmyd0O7JxNr0Dzx-IpCV_0rgm20
Message-ID: <CAMuHMdXFk+f5oxfeh2MePwpBGE2gqZXLePHzZputc6j8HwumUg@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: aggregator: fix macros coding style error
To: Li Jun <lijun01@kylinos.cn>
Cc: geert+renesas@glider.be, linus.walleij@linaro.org, brgl@bgdev.pl, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 31 Jul 2025 at 11:16, Li Jun <lijun01@kylinos.cn> wrote:
> These changes just fix Linux Kernel Coding Style, no functional
> improve.
>
> -Macros with complex values should be enclosed in parentheses
>
> Signed-off-by: Li Jun <lijun01@kylinos.cn>

Please add tags given on earlier versions.
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

