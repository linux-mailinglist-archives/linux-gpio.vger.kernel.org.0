Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D49BD229440
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 11:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbgGVJAV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 05:00:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731153AbgGVJAV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 05:00:21 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E646EC0619DC
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 02:00:20 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id q17so622331pls.9
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 02:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Eonvf/jmgN+JSu8jBX9cxTiHzSPa1/XVCh8WADwfv3M=;
        b=miNE+PqrxKhvBZ2rOOlbjHsnC+1p637wjQK7rmNWmWuc27x8ob6NHbwte9SjdXaEWm
         XHHuOK4j8nX3L1UKYUj7oO+3MHHE/lYtPumv5sgntZ7hbuCklTysx7ZFYLUlDJR2fIvv
         dJUCAOkElWHAIKzIrbYvG/Ece3Z5Iy+KTW8rqG+9OvIHo5RBwAABFN74XdOIq0FPsg7/
         vDuXvr1vls5Y8BKlQSyhbIt14AqcxhM0AH+If1RYajpegsuVgGaGqO9FyBwYT8D0ehjR
         PFJHbN3uV1nGZlQpZovlcSV7C7RVfW+b10WABYBU1cXEOiRukSPgSZH6reHjyF7Tekoc
         nmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Eonvf/jmgN+JSu8jBX9cxTiHzSPa1/XVCh8WADwfv3M=;
        b=hTQPFSXqPUl6Hd2Qa41BW7InW7OEROGDa4PKyoaFuITz8VNuqh3cRjMah4fXTA6t9r
         JgCtxq1FdAgvy5kKhukfAVe5Fzi0yjCi+bAf2jqXK+aRt8rDD3ScW7I/6aBMvwtz+r31
         1kIEgPhtcMgoJvMqTTij+J25+PCugDnTHPYSaHYjL/nHtVBpHgWUMXufrxeQqh9dqNPu
         5uRC2lAhIU+Vs5/gEXpJHAp4bf4ByK6XP4RB0fZ/yvyee6+M0LgCOGR9eDglwYBnXw+G
         tTvvnJxMz//Q2Qsg0uTV2OlMKNDJVJBJM3sfZ1k93t/6BOdViKbM2Kmzou8byysqvQib
         ICug==
X-Gm-Message-State: AOAM531utX8wSKKypuTPidt633o46Bu/06GBj2IIMEj8hga3ff6gX8Rg
        DxcQDxe+z69qZ3La7Uw7J99bZ1zz5Fkt0cl8itg=
X-Google-Smtp-Source: ABdhPJwENo55qgTUcqQ4K8dDBapxPVRdgFwJbjE6x7U/iTwHu2SybCeeSsE0fEwRvP0S4TJF4hufDUdgS9L4fvPIsnI=
X-Received: by 2002:a17:90b:3547:: with SMTP id lt7mr8854060pjb.181.1595408420527;
 Wed, 22 Jul 2020 02:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200721140153.369171-1-linus.walleij@linaro.org>
 <20200721153936.GL3703480@smile.fi.intel.com> <f8c609a2-30cf-dd4b-c956-1d90af9cdf02@redhat.com>
 <CAHp75Vf8u_uC7+GzL8bY5m4-HO8EzEmggjkMwMf2pKvF=c-HbA@mail.gmail.com>
In-Reply-To: <CAHp75Vf8u_uC7+GzL8bY5m4-HO8EzEmggjkMwMf2pKvF=c-HbA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 22 Jul 2020 12:00:06 +0300
Message-ID: <CAHp75VeKrjRBpX+3mA8XaKWoLJJok4GbwrjwuAxq5a=eegRDHw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: crystalcove: Use irqchip template
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 22, 2020 at 11:59 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Jul 22, 2020 at 11:56 AM Hans de Goede <hdegoede@redhat.com> wrote:

> P.S. Does wcove case similar?

Never mind, I found the answer :-)

-- 
With Best Regards,
Andy Shevchenko
