Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0A7A219AF1
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 10:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgGIIg2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 04:36:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbgGIIg2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 04:36:28 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18AFCC061A0B
        for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2020 01:36:28 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id ch3so787455pjb.5
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2020 01:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RrKURQh+J0Ls/c5+L7m9P3PDOmGB8ZgBuISuNngAH4w=;
        b=oJm4rzpQuFDCJKtYGkKay69r+HBKF15wNycbgFJMN5cJ8tKwgLHCA3OZYE1WdEPztU
         uW/d7lnY3ZMyPtuGb7EtI/I8znABxGUuj4wp76A8Mof1eTNvSMQDrr1NySvB4tE8tW4r
         mTOuUfIDUsucD7NZ+lFYP5Z8o4K1WwO36Yso4aDxkIr1YjitRPi6mXUkW5eAT9qeGJ1F
         tglHkuHlSo8nfApYq61QJjW/IWEti7Z+GPYo5JMKeI3OH3hhAx05UhMCAGDVuKUhq3Qf
         mGY2VaAJ042CulIJ364re66UlfxH1z5jRmF75VovfZRVIJsL6/iADeXQ1ehydrI4zjxZ
         BPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RrKURQh+J0Ls/c5+L7m9P3PDOmGB8ZgBuISuNngAH4w=;
        b=RLyfKIilCREwbJvciTQHQiQRXwKAONGnuTxEuowUCuGdxVlJ1p4WEBfq+1CGgGRLXZ
         Dy3HNc370zRUo8Qc0/Py45iOvnYt+eQ4NrCQZR59DIxRlQneysLrwrDflp9DUO3xbR5R
         gK7v3lA0hrTReGDXUDaNcK5rDko1Sz9AiQd6ys83US/47GiVuelQ8y0zzv84Z5/qoGeE
         yiMUaL0ARTKHtkm30hhPH4emmy9oLmgUrG1QldRB4fNCJplRlLNzLg4f5pM5ZjgaG4pZ
         6X6Fxw1E5I4grEsWoNYzSLPjfGAaR4pOEnmweBdCkGp/qTJsfGdK/MCW8eAbgCsXnt66
         PJ6g==
X-Gm-Message-State: AOAM532369Ng5XOYjBcFbIlyMYgt90ihQ+I4cU1BnDhab+F6SFAOoDtL
        r9T+BIgfdXGy4Ridy405tYhRh8xt7bS5Hqp2lWw=
X-Google-Smtp-Source: ABdhPJzH4ttg9kImnAREOF3Fc8k+KVpQkYmnKk8zTUKKUNEMTPCs9FzLYyletp6GJMJz6mtK9IyU7pltyhMUKwEy5pQ=
X-Received: by 2002:a17:90b:1b52:: with SMTP id nv18mr14347522pjb.129.1594283787683;
 Thu, 09 Jul 2020 01:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <5ed9d3ad-743f-e139-cf20-18eb418b24cd@kernel.org>
 <CACRpkdbWYhbtR+Tv5fFdxuyPAXU68uAswFYNZQfNFaR_89k=nw@mail.gmail.com>
 <9781e07e-a609-a2e1-112f-e5ebc78bfc23@redhat.com> <77bc7754-9a51-ed8f-5f88-3ed9f8ecca81@kernel.org>
 <2d5c5968-ad66-cbbc-a754-8f6114ff0ded@redhat.com> <ce01fc0d-e71a-26c9-1168-16926198fdef@kernel.org>
 <09661b70-0a19-e70a-1985-4da6024ec291@redhat.com> <29d9d787-bec2-7c41-30d4-d03c4cf75cdc@kernel.org>
 <12101845-4a03-802b-fcab-7fc78fed0be5@redhat.com> <071f2816-0cb6-b725-532b-08fc56c1ad1e@kernel.org>
 <CAHp75VdH1x1zhv9EkL9ROccyU3-mcxjjeOVuq3H9h2kPkUgxPA@mail.gmail.com>
In-Reply-To: <CAHp75VdH1x1zhv9EkL9ROccyU3-mcxjjeOVuq3H9h2kPkUgxPA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 9 Jul 2020 11:36:10 +0300
Message-ID: <CAHp75VeGB7z4iRjnbn3jy=SvMWuVp1-iO-27sdu-YPTFtOeA-g@mail.gmail.com>
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

On Thu, Jul 9, 2020 at 11:34 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Jul 9, 2020 at 11:30 AM Jiri Slaby <jirislaby@kernel.org> wrote:
> > On 08. 07. 20, 13:47, Hans de Goede wrote:
> > >> Unfortunately, there is nothing like that. It's discussed on the net,
> > >> that these UMAXes have only 32bit EFI.
>
> Maybe I missed something thru discussion, but is it possible to flash
> custom firmware?
> Perhaps flashing CoreBoot will help.

Yeah, I admit it might actually require writing the support of this
board into CoreBoot :-(

-- 
With Best Regards,
Andy Shevchenko
