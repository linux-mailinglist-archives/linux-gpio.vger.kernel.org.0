Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0DDB3A6E29
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 20:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234505AbhFNSZU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Jun 2021 14:25:20 -0400
Received: from mail-yb1-f177.google.com ([209.85.219.177]:42570 "EHLO
        mail-yb1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233706AbhFNSZT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Jun 2021 14:25:19 -0400
Received: by mail-yb1-f177.google.com with SMTP id g142so16756634ybf.9
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jun 2021 11:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mJ8KAixbNZbEW4J105zNZlUGEcS0JFau0ZPs/5NCl1k=;
        b=tPLx0iWstMqcLP2aJ/stobRUD+nTXb3rzMEURAJ1x/CK0oRLxqwel/scAADgp++gld
         rZC1OZD5yPrhy/VUl9XOtacaGQvQF8sEoCtxKUQ9yaRxPEC1yQ/zdC86Q6CLgo+qD8x0
         USXmE3suR9vCPBkFLvAkGnTcj2sk1XUFzCmHeU7+nycxissn9TkJaoInfqiAb9H1k+rW
         QdfZx5rn+7dcjHYMSCQ9QjIi8pQa2a1/UP0RqTqZ1+5+MLqx0XCY+n6zp4c7raTIVDlp
         pVuaxZVVmN/YDU5Hsk0KYaviubzj4ebLg9la++XK5edeP1C6w29t8nykUtjvTH1bhmG3
         G8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mJ8KAixbNZbEW4J105zNZlUGEcS0JFau0ZPs/5NCl1k=;
        b=VvvgIJVE58asvdkfWSnzIayTTxpkoIPOI300q5ojJEzX3TQPU7xVA6xWILIP0DuBRB
         Ky0a3+MsDAHpt7KrlJBcfh3zD8zQ5AS/d3SdiicsHp8oBIsa214a1v8MqxwyRtHhuZ2B
         hBZkCUQ9j74XPCucEPK2FR3vpSTWyYWni4j/RJKk9Rzd86dbxFLwRaw8y/7zo9wmyJlt
         AOgydjrPDP45hbfcETI6LUTMrSlZ8V0SP2ea8JVjml+yVttdh4ywrEUkf3uzlFnfUxoj
         50dyS1Sa7a0F+erkzx0ZSmxgkBwRKAa5a+fqRdsypdc0MzCQtg/nnXAybea8vSDkyQoK
         lBNw==
X-Gm-Message-State: AOAM5306PgcpkKtLtZ7ARo+2LAoKue1iMVNDEoUWtVsTG3WmiWvN5FVY
        l1veC6wjWdxwGfT6eToqySxmOK+1EvYc5lNLA61eeg==
X-Google-Smtp-Source: ABdhPJw75UOpwMo1TQmH5VOWBLtE5ZAnlQKVQP8IAJnfRx4MPnlJsR0DzLZU5Zfizg4Rw7OaQ6hX5lCKRUe3WE6CkJg=
X-Received: by 2002:a25:1b0b:: with SMTP id b11mr27373062ybb.302.1623694935711;
 Mon, 14 Jun 2021 11:22:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210409140806.31824-1-srinivas.neeli@xilinx.com>
 <20210409140806.31824-2-srinivas.neeli@xilinx.com> <CAHp75Vddd6ygr4mJ9Z+SuGZmfLcgDLWLZaxby2XE2mX8War-qQ@mail.gmail.com>
 <CAMpxmJW=HWf_NxGpfBkX=utgOTs4+6RtypxnKGtpuYnX=t8rGQ@mail.gmail.com>
 <DM6PR02MB5386CADF5A10EF28A640AD76AF4E9@DM6PR02MB5386.namprd02.prod.outlook.com>
 <CAMpxmJV_CtFQpZvr_H0g3DvPMQZwqa-9z2FVxCLX=tF9Ytkj7Q@mail.gmail.com> <DM6PR02MB5386A84774C2430F4BDED84BAF319@DM6PR02MB5386.namprd02.prod.outlook.com>
In-Reply-To: <DM6PR02MB5386A84774C2430F4BDED84BAF319@DM6PR02MB5386.namprd02.prod.outlook.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 14 Jun 2021 20:22:05 +0200
Message-ID: <CAMpxmJW4DaePgVq43zOHQ4OzD8cx2EeWb2hktpwJ1S_JNeAw-A@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: zynq: use module_platform_driver to simplify
 the code
To:     Srinivas Neeli <sneeli@xilinx.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Srinivas Goud <sgoud@xilinx.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git <git@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 14, 2021 at 12:39 PM Srinivas Neeli <sneeli@xilinx.com> wrote:
>
> >
> > Andy: How about we give it a try then? If anyone yells, we'll just revert it.
>
> Could you please apply this series to gpio for-next branch if there are no issues .
>

Applied, thanks!

Bart
