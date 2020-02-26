Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7EC3170203
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2020 16:10:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbgBZPKu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Feb 2020 10:10:50 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43870 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727992AbgBZPKu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Feb 2020 10:10:50 -0500
Received: by mail-lj1-f195.google.com with SMTP id e3so2425801lja.10
        for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2020 07:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ywGQ4ap8hZ15UaHkfn7n7MWKYQk9eNuFHiTciR36DjI=;
        b=nirchHRV4fFyu1LmTe+rSa7LF4PjDFcQPCEV2Mb82lIqYC24fYT8R96zXVIa+YmuSz
         7zk+Bm81Ko05N/1dbBucngPrxQMVc8oka+1lIaDlMg3MZDsJdtAWRyJt2pFG9yLj7NoK
         mX6IVxUujBmOhH+veDdBaiamCQzLnL22tjClqSYPnevhJrDOxb1nRZzzFZPg+58fCYHz
         MJl02rTkFd0qCQZF2IgqnZFE6NnojNA0reBtfgm9ToudHYAi75ju3qAYA7BEJQC9WJYO
         e6ipsPQDE5PUm10oh1gYb7V6he9LRaLZhSmbDwLS3vPxwFvFkcWdKl6UXPWNJbQGhXxq
         /MOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ywGQ4ap8hZ15UaHkfn7n7MWKYQk9eNuFHiTciR36DjI=;
        b=DcU/TKrKUuaWve2RpLuuiAaLUmyEhh9/6tztwjVjMwq0fcf56GTzFzv+Xu/aHeSOhD
         LRDH7sqLqmD1FjJi9ay3LhYu/3O3xXsP/TrWWQZVhVHIY6o6HpLVHoFh/h6BQ22sS8Sr
         A9Xj7KnZWD849h2trVx5MKStnM7gEAcXPofxKNd8no08q7EYpf4L+/EPLVv3GTYnhuFq
         YCwW4iqrMorbOr5fRNrniocj4yw7SNnnAHfv9NuHbWPfbQcsHy5vwwTdcY7cGPGszpNl
         tb7Muz/NNDsUSGyhSvJQ6NreJhTCJ7moJnPx6+dKPm6mSjxwK0LyGlnLiRk4vOzI8JtZ
         Y+eA==
X-Gm-Message-State: APjAAAVOHCVgCWnbPEVskdB2ZjzJRkLjP34rtmQf53pO/DTwWS019Lzd
        olCEJ4xqEK3bfZAE8qZQHBWliuvIRpmoj7o9hiSVzg==
X-Google-Smtp-Source: APXvYqznZ8kj7GOah27MLill09M7SOEW1d+KW4g55YWPxyVlegHJ9NdRHCHMWArmO6Dux3q5zquFPbEsvN/g+rrwh/Q=
X-Received: by 2002:a2e:2a84:: with SMTP id q126mr3191242ljq.258.1582729848529;
 Wed, 26 Feb 2020 07:10:48 -0800 (PST)
MIME-Version: 1.0
References: <20200226104529.17745-1-geert+renesas@glider.be>
In-Reply-To: <20200226104529.17745-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 26 Feb 2020 16:10:37 +0100
Message-ID: <CACRpkdYmbWXK0+HLbH1aXwTSrv__RsKC0tnVZwWzORF5Xqq_=Q@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.7
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 26, 2020 at 11:45 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:
>
>   Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.7-tag1

Pulled into my "devel" branch and pushed to for-next.

Thanks!

Linus Walleij
