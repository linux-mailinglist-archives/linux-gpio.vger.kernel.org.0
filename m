Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4434219AEB
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 10:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbgGIIfI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 04:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726228AbgGIIfH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 04:35:07 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E1C7C061A0B
        for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2020 01:35:07 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id k71so797795pje.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2020 01:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YsJm0YVXZRFoDQ1GrerM/pnzucV0hyRW6FXYrMJphLA=;
        b=EvyKK+ANyyiDpSqg+KOmaO2e8clvnSPPxE1/jZ/KcuUEkgD8IyZJTrJk2TNyGhgvA+
         rUe+2Cf8uBJhsDCCEhWTdcFGHUU/wTrLHHLogXNftl1B4x7S8b0mViVyIF1QDZWaTx7/
         Rif6560KIZLgrDb8sywdkNAJJnak+H/KFfpE25ya8W0HtvgnzeNYeRyaTFwTsBu+yr2P
         TbWPZO+HDXZFFkKI2ZE+cYFGdEOMBah3FYK0q3cve3obRJxvUXcRoT7xX/LC3Kgx5nr+
         fGfjXNKTfrHGhgICqM+REeDFWi+V3ewfejaVcROyeTO4nTlUQcFkiDFKpN/wl0RWo+Vw
         DnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YsJm0YVXZRFoDQ1GrerM/pnzucV0hyRW6FXYrMJphLA=;
        b=T3y3XYhIku5f+UadV2m3OQgBSq9SjHZhc7b1h0w/mn6krWxkUy+I2jpg/cTPugDG+u
         va01GL094P7BaL2m9FRaif5P+Z92VZi21MQiGq3IvDVDwvThsE/Hh4qAKA7uBTcRaQJL
         iw2lAFByzZamFxvaqMl63jyhZZBtZjz/5E6/wO7cjWykwGuMyj3Pr7tVVzUb2R5zswjM
         uiOJdLw/nXhCk8AFMlLXAB9eA0dMPs+lq6ihDOT543YrCZLWWADpVDLASTlW9HTGmTTA
         uI64zOEA5B5DUki9HJaTzOWMQRfwXBjGCpDoePC0BQI6Ct3wIEDtKErG//trrMSfsrZv
         bkNQ==
X-Gm-Message-State: AOAM530cZeSPVyIy64AVGGRB9uQWR6MReVFbvXJ/AEhJxprDkwPeXqwF
        XoECL62cODAKodwfTBU/iYbKsSIJvmPMEacU304=
X-Google-Smtp-Source: ABdhPJwd/2umLKzCyDcHHCmU6dtsEbUJl6WzwKdwcSbnAWpsdhmRC9XHQJh/7yz3Cy9kXYAsG/WqTbgjsQolxB7iBbo=
X-Received: by 2002:a17:902:7288:: with SMTP id d8mr54658906pll.18.1594283707046;
 Thu, 09 Jul 2020 01:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <5ed9d3ad-743f-e139-cf20-18eb418b24cd@kernel.org>
 <CACRpkdbWYhbtR+Tv5fFdxuyPAXU68uAswFYNZQfNFaR_89k=nw@mail.gmail.com>
 <9781e07e-a609-a2e1-112f-e5ebc78bfc23@redhat.com> <77bc7754-9a51-ed8f-5f88-3ed9f8ecca81@kernel.org>
 <2d5c5968-ad66-cbbc-a754-8f6114ff0ded@redhat.com> <ce01fc0d-e71a-26c9-1168-16926198fdef@kernel.org>
 <09661b70-0a19-e70a-1985-4da6024ec291@redhat.com> <29d9d787-bec2-7c41-30d4-d03c4cf75cdc@kernel.org>
 <12101845-4a03-802b-fcab-7fc78fed0be5@redhat.com> <071f2816-0cb6-b725-532b-08fc56c1ad1e@kernel.org>
In-Reply-To: <071f2816-0cb6-b725-532b-08fc56c1ad1e@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 9 Jul 2020 11:34:50 +0300
Message-ID: <CAHp75VdH1x1zhv9EkL9ROccyU3-mcxjjeOVuq3H9h2kPkUgxPA@mail.gmail.com>
Subject: Re: chv-gpio interrupt storm on UMAX VisionBook 10Wi Pro
To:     Jiri Slaby <jirislaby@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 9, 2020 at 11:30 AM Jiri Slaby <jirislaby@kernel.org> wrote:
> On 08. 07. 20, 13:47, Hans de Goede wrote:
> >> Unfortunately, there is nothing like that. It's discussed on the net,
> >> that these UMAXes have only 32bit EFI.

Maybe I missed something thru discussion, but is it possible to flash
custom firmware?
Perhaps flashing CoreBoot will help.


-- 
With Best Regards,
Andy Shevchenko
