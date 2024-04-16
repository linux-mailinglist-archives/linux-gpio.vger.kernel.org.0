Return-Path: <linux-gpio+bounces-5549-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFAB8A6C97
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 15:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BED72825E6
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 13:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEAC512C7E3;
	Tue, 16 Apr 2024 13:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sp13Bn2q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB5212C499
	for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 13:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713274422; cv=none; b=M1cwx+4lxmYA6RjU1kT8ciXTEs+ShfBpeBnqLtLhMhujVdzXfdOs4QFb92pQ+6yUcdVri40RqlXEdHUtn1vV1xVFf0Z7si/DfZEoK/7+4Pn8E+uESLTlq9cun3/v9EYY+GogaWN9CJiP/dppFSCjmANUOobJiOKPayuUmKUAMIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713274422; c=relaxed/simple;
	bh=xm6C2Ao4ypYVX1MhC1/uBnS+FZuFYDGrl9Ts/4p+yMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K8uKvDQ/cQO+t/a8Mt9r0FnS00emICvUzpmtnCK8D8dkqXW5EcsJcY2M+lHxVFSpNXHufk2RnsuYoE3RzsHShyGL+LHMiQXKeDVjOqi/bY0BgeRf0ChK6CyNLIQ5A558elxH6eUqgk/cpJYqXblXdRTuHtUwKcD/fnc7muhdzpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sp13Bn2q; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-de0f9a501d6so4354409276.3
        for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 06:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713274418; x=1713879218; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xm6C2Ao4ypYVX1MhC1/uBnS+FZuFYDGrl9Ts/4p+yMc=;
        b=sp13Bn2q9evfeJd9EipdsvPvJJ20fsLxtu0e2T4sOIsoVi6tEwHFgTMPr5hJ4xvL3+
         /XdlATepihbkYiwQOGMiQDKuWfJuUPxUKDbuB1868msZGPLH4GWxbaadktcuzaeRHXMO
         tuViVW0TSHIgH6skftZVOmR8Fhkg+9pMlPtQ8AQ7RwXLqRr8H2N4R+feh4gRPn1fIYcX
         /hhW/WFC0qy9cyzSZxT1fNQ0o+1rIFQkUtLBrqYizWYrrDK95ubNBUibgZGr7HU8fmKR
         8CXciflHH2xxD7qZEqv0QauO8hzpcjneMx+nNtikSGMwFLA6/crxNdOJvXptr5Ir6E5z
         UO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713274418; x=1713879218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xm6C2Ao4ypYVX1MhC1/uBnS+FZuFYDGrl9Ts/4p+yMc=;
        b=xSY86hJrsPXe+AfYLexHQv2r//Zkq6KRdAwM+wkC/0VKy8evywtdrbXlG00Tu1X7g+
         zw2R/8c+E0J+fmNtjN/ag9BUaGrcdrDJoytV6XHTpvqfxUNORh9qFVPnzNvYX2bZNOFA
         8GgGHBMHGcwqS2cyAAI1JSyRMErIAVvpyq0C1DCXEO+VNLwm+5RDlgbwLa1nHB1PvjB9
         b1z3riKUcC1/6GdojXIm73P6ZULFqbVKcCjLTdp8PSXsImk4veMuumKuppxpFsgkRAqX
         vL8K7LXPX90ShXUEPJwj4p5k3Ko8BrUjJyAqCaYLVgIObVgTmbjq5J7tK3KaCvwE7Rpa
         /E6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyKAnzn6+aeGiPey/TLWEwuLSaDl6FNrcZ2eEgg9Ybi7btLGEyX1kXe3NReWtpG8YpZuaD/g5UzdtENO4gGW7xFbsVjTJ3rAyd9Q==
X-Gm-Message-State: AOJu0YyNkbAR6BFaUBPNjj67OpIY0TQduV5YfC5GZX//WRkzbILJ2VUn
	sTgVnAMNqJFdgTnLc01fFnw9xnb/as48KaS4N8jDk6xrt6oP5rQpRA8Z5gu3K8YgBS/CgXrtLbw
	jZVX63fAHUjoC+VMkKWjo3Dea+6QmKzHK4+oB2g==
X-Google-Smtp-Source: AGHT+IGhXYN8RFtzdBC2XFtqBYQ0YqRkDw4rw6+jm0oCglv8rsHArIyTep+NJikgb3knd6W2WrjZHHfgC8IvOHzqHkA=
X-Received: by 2002:a25:3341:0:b0:dce:1871:3d30 with SMTP id
 z62-20020a253341000000b00dce18713d30mr11319804ybz.21.1713274417844; Tue, 16
 Apr 2024 06:33:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415105328.3651441-1-zengheng4@huawei.com>
In-Reply-To: <20240415105328.3651441-1-zengheng4@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 Apr 2024 15:33:25 +0200
Message-ID: <CACRpkdZz0zD62T8cxXQkTjkR58CZ3_0uVr5F0Amy0Qa9jrc3nA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: devicetree: fix refcount leak in pinctrl_dt_to_map()
To: Zeng Heng <zengheng4@huawei.com>
Cc: linux-kernel@vger.kernel.org, xiexiuqi@huawei.com, 
	linux-gpio@vger.kernel.org, weiyongjun1@huawei.com, dan.carpenter@linaro.org, 
	liwei391@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024 at 12:54=E2=80=AFPM Zeng Heng <zengheng4@huawei.com> w=
rote:

> If we fail to allocate propname buffer, we need to drop the reference
> count we just took. Because the pinctrl_dt_free_maps() includes the
> droping operation, here we call it directly.
>
> Fixes: 91d5c5060ee2 ("pinctrl: devicetree: fix null pointer dereferencing=
 in pinctrl_dt_to_map")
> Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>

Patch applied for fixes.

Yours,
Linus Walleij

