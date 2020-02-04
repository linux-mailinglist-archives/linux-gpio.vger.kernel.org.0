Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAD1F15182B
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2020 10:49:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgBDJtF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Feb 2020 04:49:05 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:33006 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726375AbgBDJtE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Feb 2020 04:49:04 -0500
Received: by mail-qk1-f196.google.com with SMTP id h4so6404878qkm.0
        for <linux-gpio@vger.kernel.org>; Tue, 04 Feb 2020 01:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Wpvc5kKGLK6Ztx3ugNtGTibGd0YcXPyYNZJtiPtJCtc=;
        b=uW0/fuCrWVwPF9/xXMOQtew2KSsumLtmuwMuzgxK2LdEiBDqsj0p2Mbyi96ite4EZB
         3eGHtIWEuuAkEfOeF5RuTxyyrQSg8VLNEz6AfCDzJZC8GDIN7E0wziDJNtfZwlthyhim
         CxfBng98ELjNz3OiZF9OoI6/8SvKIG8XQNgP8IKx3ftKsGAbKhR1Fk6RgVqCcHo42EPy
         H1ssH+Y712nZRv/8SVvFwWW443qI34DCGz29hC4HpdAXa9/N7Sd3jj7Bsdw26WqS/UrH
         Iqqrw/pYSHUQpXMqW2E+qJpLqeL3az108KlQpOwviX1CKCJ7cKglmcPx9jDKSljDf/WE
         Nmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Wpvc5kKGLK6Ztx3ugNtGTibGd0YcXPyYNZJtiPtJCtc=;
        b=WTAlRQHa5FZxfthhmGKPeEnvK8/7cfZCQ0MxBwzTV0/qjUDsFsUd2CzR7f99uHq9m0
         F94kTCvoyj8CZrkBsCC36e20Yox9YtcVKyxQyipGUZa8xCSCcS0uDpiY6gE+fudjcL+t
         Zsvi+FqI9Pc4cTzxVU2GLNc8HQnZdG9yJZnpr9FLNP0M+KZ6CucNhFdtNkUAjdtIHA4H
         atERO3QInhlz7aZOOlB9QvwFrj6y1wu87+748Yxgy1Hk2HmGcNc2rhCsqeJ1YHN1btzb
         hphvPUXTOSM7Bilmdc4HuIn+veVT0t67m79MM7HvgrRKKK2xlbk5XkaWP5xlNdNwQnLk
         lnhQ==
X-Gm-Message-State: APjAAAX0aw1KOObMHKnXYWVNZXTNifk/NbfCTZBxnZ4xNllpyVJl2y+a
        kPG0r3LCpGc1j+waEayamiouaIi2k95IQLj1rvVl/ZX6
X-Google-Smtp-Source: APXvYqz2MeVh06K7Tbpq8ZvrT8TNSDdlMJOBX4znhomUHi7gVvaTjHXpJPPEK0L9rW1jsGASpu5RwyaBsBYFdisCgEM=
X-Received: by 2002:a37:6fc4:: with SMTP id k187mr27135332qkc.21.1580809743365;
 Tue, 04 Feb 2020 01:49:03 -0800 (PST)
MIME-Version: 1.0
References: <20200128160325.67636-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200128160325.67636-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 4 Feb 2020 10:48:52 +0100
Message-ID: <CAMpxmJV-W716T6ifcGiquAwVz+YDggZinP0CDZoJLyd80vswsA@mail.gmail.com>
Subject: Re: [PATCH v1] MAINTAINERS: Sort entries in database for GPIO
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 28 sty 2020 o 17:03 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> Run parse-maintainers.pl and choose GPIO records. Fix them accordingly.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied for fixes.

Bartosz
