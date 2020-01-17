Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9349A1404E9
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2020 09:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729451AbgAQIMW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 03:12:22 -0500
Received: from mail-lf1-f52.google.com ([209.85.167.52]:42798 "EHLO
        mail-lf1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728986AbgAQIMW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jan 2020 03:12:22 -0500
Received: by mail-lf1-f52.google.com with SMTP id y19so17652493lfl.9
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jan 2020 00:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uxTtS/PAyYu4PhY4731eluF8s7eyQqI9JZGrr1rS1gQ=;
        b=SJglOkpFfLGWso6JXxp8TVd9mBPLE/eyxasneimQbQAVPow3Ff5F9sMXAiZ6xjRtOq
         teqkgdFTNtOj130NNo3fxCVjqQRUocxq3rem1kT+7EXYwVbM9QDL6osexKS5WO58aIq8
         Bnlgu/urUeXdGfqHz2k2yBP4lumbDurARlHjrGFo0aLsmucK8LvSPiA9fSQQlZA4GbYN
         JplUsgekZ+upgunt139DFbsyZzKJKkn0BCKTUBXivr2DUroqxiKJPtQy2I2ZxgPI21rB
         V8WpBqkvkUZK/IE5WurqkgIe/ik4jGrYc3sQNqwG6XJ8fkKvV4CIvyI+TLT/L32Kl4L8
         Ls7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uxTtS/PAyYu4PhY4731eluF8s7eyQqI9JZGrr1rS1gQ=;
        b=cUVvAQFt/2ainkxNDXPq1dESLStqPCDIbtEOLW7lJDYJ1Iqab5xr00PZzN0YTS/b9d
         bhbpVvDVJUd6nxgeCAlU/DvaafY6halKBOhaUQebqp2/IaGjE85MmI5ecPMeRQGdTvRA
         DiTtkJqMJucJ9vAwIZ7wLGtWoPyB8b2h5DDTjYVSoa74sEaxV23lpFYQzyqSqlwMwdyW
         wbGT1USHZnx14Zk8M3kROBen1681mfORMzmvj9ys+ZkC3KaQuCqQMMo6SAPPfinyLW+A
         KNWwAbuvJyhs4nA83/gEin5wDkzwxLVo/OXlmUSZVSzaahbfnh/6jgpmSlOfyDbufNG0
         6rOw==
X-Gm-Message-State: APjAAAUzgw3iEP3IQazwrsTvRmyuyelF42W3F7zr+aiSfuNVpCW0IN8s
        cZK/cm8yNPSHSwY4TEBee/LFUfKMRnqJcGIa8+qd0d4Lsfs=
X-Google-Smtp-Source: APXvYqwCoFlwaX9pa3RlM+pU/7sFZuE1VmJHQPiIfhyj1SSU/TjNQuX90/vXu+jBdalB0tDwuHviahRMlO+f+K/nWLA=
X-Received: by 2002:a19:40d8:: with SMTP id n207mr4522802lfa.4.1579248740306;
 Fri, 17 Jan 2020 00:12:20 -0800 (PST)
MIME-Version: 1.0
References: <20200116142927.58908-1-yuehaibing@huawei.com>
In-Reply-To: <20200116142927.58908-1-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Jan 2020 09:12:09 +0100
Message-ID: <CACRpkdbO14QeTBX0C5X5B3tH9x5QvahaAkW2_bVx5bfRiCzgOQ@mail.gmail.com>
Subject: Re: [PATCH -next] gpiolib: Remove duplicated function gpio_do_set_config()
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 16, 2020 at 3:29 PM YueHaibing <yuehaibing@huawei.com> wrote:

> gpio_set_config() simply call gpio_do_set_config(),
> so remove the duplicated function.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied.

Yours,
Linus Walleij
