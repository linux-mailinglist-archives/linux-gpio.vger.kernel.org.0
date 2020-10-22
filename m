Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 782B32962A4
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Oct 2020 18:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896989AbgJVQ00 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Oct 2020 12:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2896986AbgJVQ00 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Oct 2020 12:26:26 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0799CC0613CE
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2020 09:26:25 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id l2so1235571pjt.5
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2020 09:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=fKNuFz0tzESvWOS3N0ECBXIENv0ncOLksuDyae91gxo=;
        b=eIuwhwNM7/e6g2lJH2p1JSxYRXMyrZuDb/uoVl4JiTJqYc3ZV5zFgjfrMbPGUPf0EQ
         Q7ZDh+BF+qat1f19gMVKn5kn9ze4WWPIReyqIR73+YK06h0MrF65dK/pktL4RJagsNB1
         9VccngiFNAeKKLLc5z1HX0qesGO8Mt+ZRycDFRR1hoSzf4CMILS11C7Mzo2kM1Yy1GI3
         A+Brup7pgZQkRwuVQ7neUlbWs/QpTFsep14bfA3IjtOnTgg6G0CHmkRXVzkl/3VL4eRi
         CS3wt0wonOJCKyfZapZDeBvJ7v3aKiIuvab7VQQ53kWUG/qvAPUcTqkIahjWf7sotpR9
         80PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=fKNuFz0tzESvWOS3N0ECBXIENv0ncOLksuDyae91gxo=;
        b=oEAt4F1NM/e59Rnwb+Wqd+TJE2eCjkrfRJ+XtnM+0T6ij43g4joCikXtLogtqgNqSC
         kBYmbz9UoW2kGEUDQBhFONXJLcNsj6RQkELV+0VIDPkquVawcTkCOJ5aSaD4tsxSGAmW
         ucjPMTs8FNNGKTkDUbpRDp20uECa9SrS9tWEUe0kfRJchHytTntMjPK+54y0S9xk4DMB
         pHxzDQgJ5bF6tV5WH/gvSeyfkr3NrpcWmQiFInAKIrMUe6v6PEkx+nwJbD/JopWqzQjX
         TU4Hfyx3URPnMEy8JM0YErk72bpQkL/+N55NSByvPLhbweEL9g3ZU/wx7Llg0WjXyApm
         YhDQ==
X-Gm-Message-State: AOAM531FIhIGJHK2BDL3NpifGcVnw12uwwwLaln0OiKHTdl7iRpxvtsM
        urptTinJUADKgR7XyA2Hk/nnvmTP94EQNhg77yX4DL7hDPp3cQ==
X-Google-Smtp-Source: ABdhPJxX5bh5a87MVuRIM3JKmD4CRme9x+VijnusIPyvkQtmP9ywNmm12B7AimtEJ9kc7dWIOAcyOWGkgizrAJ4xcqo=
X-Received: by 2002:a17:902:6bc8:b029:d6:d9d:f28c with SMTP id
 m8-20020a1709026bc8b02900d60d9df28cmr3115440plt.17.1603383983916; Thu, 22 Oct
 2020 09:26:23 -0700 (PDT)
MIME-Version: 1.0
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 22 Oct 2020 19:27:13 +0300
Message-ID: <CAHp75Veqdv8JnASmmsnv9AmrktByWH3R7Z36wLMyjJh0VffExw@mail.gmail.com>
Subject: Is consumer documentation correct?
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Alexandre Courbot <gnurou@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi!

It _seems_ between
  79a9becda894 ("gpiolib: export descriptor-based GPIO interface")
and
  14e85c0e69d5 ("gpio: remove gpio_descs global array")
the "Interacting With the Legacy GPIO Subsystem" of GPIO consumer
interface is correct.

But is it the case afterwards?

Details of the question are here [1].

[1]: https://stackoverflow.com/q/64455505/2511795

-- 
With Best Regards,
Andy Shevchenko
