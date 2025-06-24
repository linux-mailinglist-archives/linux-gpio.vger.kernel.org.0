Return-Path: <linux-gpio+bounces-22086-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A9EAE6F5B
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 21:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68C9D1BC5CDD
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 19:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A25E246BD5;
	Tue, 24 Jun 2025 19:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nUHQ22oS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124A01946DF
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 19:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750792689; cv=none; b=EJ6w3Wc8N1wcFlcFly+4lK7BznfTAOz8UwZ5EIO5DpjvVaefJpeX/xWnb1G6Ks5ugy/73gEUSbOSMGhC4+k8Mcmhh+TJpUNEtrEAYYbFH8eJ4PIKTb9J4AzShd9sFCxXCisLifzRsw6JycZKLsFB69T7nMTt07m300kcsNLnLYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750792689; c=relaxed/simple;
	bh=rlVXyiPaoDofT68Kl6k4LwYvAUk0MKvVfKfqUm2AAQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qYKyjrzXR9kB1oia7gpnSz1fFcUVO5GNJplil1IW7Zsk757/Ail+A+10hRiGO+RnEvIwMuttI17R63ToT0vYOqjYYnqYrAceKLRfyKBblonp1IfBAAyh8GEYKmze4lZjIGB++BGJ1BtskPw9Ds0+aasp8WKYQWhgw9kDbZhqaBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nUHQ22oS; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553dceb342fso735456e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 12:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750792686; x=1751397486; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlVXyiPaoDofT68Kl6k4LwYvAUk0MKvVfKfqUm2AAQA=;
        b=nUHQ22oSLhAFjtUXZm3Ql3svJys8sFwLkxrxP9oWNjDXa5ZwRp/iBNsRTNHPNCDVXf
         WKetQcQQAMZgvWJjIfNvdJ+AwyeRdmT9i9ysBHenLmVJ3wAtNSQ/qHKwc0kE5g64SlKX
         PIvQmpT8zOA2JgAfKKq/La1W/7O+MvnN8jX5IM/I0illIwz+gqkHgUV47S4V1aWnKWIc
         8jMzOQ1nqSavvwqhMKRMGRUiGsbQCx4wKwB26i4elsPiRhcqDqwmapTCNTzIqy09mHBh
         7l33grqynegOasNM9OsRhdOh41yC2escMumM/WxQAW3JtsvBm5bjJyT7FWUrCWTY9PqL
         C1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750792686; x=1751397486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlVXyiPaoDofT68Kl6k4LwYvAUk0MKvVfKfqUm2AAQA=;
        b=ciXUdj3r1t5FYzLI49hJrbHKX6nCE/IYHFNUkiPBa/7E9+SLY6o3emiAcqjqWepqgG
         u42LL6a/CKIt/H4+5MMbzmme95YUaSoc59HEvbTCrpLiSDRnBSFasicluiscDpvGa1VT
         VgVAFDhzvq0XyYGp7N89cRfCR/G+O0WvDZvaup5s2ePOXU4EOOXhIyqZUdt6aabqIwF7
         FQ/N8sgoJsJdZ+wSP/5GD9z1AvfxuFFkWaK6o/ljqkCh8Faxa/pN2/0FTXjnYVNAnZxg
         PNcf05J1Ry3CVzNeItx2Q051z1eSwNj5PmYPXxxazBjeht66T5RZ2VPGRt+UUGsi4Qfr
         /wxQ==
X-Gm-Message-State: AOJu0YzUtvKTb/n7e8Icf6cOE4S0Pd1SaBy7JD9aIwfABhk94rkMgpNQ
	E3pyTh8GbTHt+c9iUOIMcruD8YhSou24WPxAdLyTgY6cNChhkTgKQugYvMkuZCAiYjmgBkoy8IX
	fUpYFHc5ecRft1kdHIgV3W5ZtKYanJcNkLdBEPoe44w==
X-Gm-Gg: ASbGnctw5/OZu/8Su+q/71YHIBP+UZS57uffwa0Cfr1vuAbPcJgNEwnEs3qA3mUmWk9
	izjWowR2189u2ptAl8YPNS2E9MqEvFcfSW9gE4fLRF5N4NDP+yNVMrAyWYit6SheHfS+PolQ4td
	3vaEowYsW+8qeSXZgnUmAJS27IuL5nW/jR5j0Ct55WT2c=
X-Google-Smtp-Source: AGHT+IFRBqQQlZzmsyWAYd/fJO69xU5qiVZgLBjJUdgfVBCQ+ItkLOaHMARaUX9KAs2hBQpx0fD6NPKZSopDiZk+7Hc=
X-Received: by 2002:a05:6512:3991:b0:553:349c:6465 with SMTP id
 2adb3069b0e04-554fde57958mr25095e87.33.1750792686171; Tue, 24 Jun 2025
 12:18:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620015343.21494-1-chenyuan_fl@163.com>
In-Reply-To: <20250620015343.21494-1-chenyuan_fl@163.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:17:55 +0200
X-Gm-Features: AX0GCFsyN733x2NMyJXFZzqYTBVf21W_AH6wHIRxGUCRJ9WSimGlYAoArQO5BDI
Message-ID: <CACRpkda6EYeKKpVbJ=iuQTC+X2JDmppf+Bq2Lq8MeyHTCOPfJw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: berlin: fix memory leak in berlin_pinctrl_build_state()
To: Yuan Chen <chenyuan_fl@163.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yuan Chen <chenyuan@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 3:53=E2=80=AFAM Yuan Chen <chenyuan_fl@163.com> wro=
te:

> From: Yuan Chen <chenyuan@kylinos.cn>
>
> In the original implementation, krealloc() failure handling incorrectly
> assigned the original memory pointer to NULL after kfree(), causing a
> memory leak when reallocation failed.
>
> Fixes: de845036f997 ("pinctrl: berlin: fix error return code of berlin_pi=
nctrl_build_state()")
> Signed-off-by: Yuan Chen <chenyuan@kylinos.cn>

Patch applied!

Yours,
Linus Walleij

