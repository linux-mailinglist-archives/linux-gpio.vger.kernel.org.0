Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CDDC11E486
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2019 14:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727283AbfLMNZi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Dec 2019 08:25:38 -0500
Received: from mail-lf1-f44.google.com ([209.85.167.44]:39278 "EHLO
        mail-lf1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726930AbfLMNZi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Dec 2019 08:25:38 -0500
Received: by mail-lf1-f44.google.com with SMTP id y1so1948689lfb.6
        for <linux-gpio@vger.kernel.org>; Fri, 13 Dec 2019 05:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E1RN9Xi2uKjhAQbqlaMgFwbJxG8IxAQgFrusNk+TeI4=;
        b=SRpBsegJ9H1LmMB05oa2iQjmpkB9PZHPpHB45YOjPcksN72Sj7nTO0mJ9WViY0xaVm
         nVlSJ8nv0jboJ3oMEJ19u5DhuHVpPBe5yksHvj54TBt1YxCOpoY7ONu6ERNidMazobUl
         71P5GBONfnHqGbM5Pbh90wmUE2l8n/gRjHEuHbb+bZPvL3KwnAZ5JafTilLrs2rOOjb7
         LFmDbXpeFVJWvDZo58hyUqF0Wt+qIPcmqbdm1v9REoQwkM1kJAO3OBuMG12lA6R2m9uW
         8is9YdhyFuERew6VAOwzOqCN0AALFkS916YZHVRoxBwIRtHxqxjTE5E/wgLy4GzjgGrj
         uMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E1RN9Xi2uKjhAQbqlaMgFwbJxG8IxAQgFrusNk+TeI4=;
        b=rkx1rGZPr87IkqbywXZQc3DAkG6rHWh0Fc4t3aEGPQKUwdnbDjgqG3OnoLyAtTfvIb
         obkbAa8qGt/LiYZNeuKLqPP2LkwCVzzCLFsX9SCJPFtoXqIbEVrfxNWNWRtMhRACbiKA
         OZ8p+SP3SQmMXRG2oXkKXbDRLb6kEYAoXC1rh42LJzho/QOrrMo83QQfwnhGjoHxWWON
         sREegeDbyKqyTkiVMUNMaaxQaOZ7y/BXENSAowKtstWnt9aLjw84MjXOGCNWyOb2Wo2X
         T3gSWfagEYe4LOK1WwHT02dx0R2HcJ3VSwRUaOnGZ2La2//Dwj+rM1kXx2gFLsOc/bRK
         8FQw==
X-Gm-Message-State: APjAAAXmaBJ0em+hYvZIzn53LDaoy77B5G5MIl6lUOF/g9B2OK2VtS3K
        t8Fi+BhBLUhRD9syKHzb1QL/eqxcT/eLzIEluoyTsqr8gE4=
X-Google-Smtp-Source: APXvYqyBuo/x+1Ru5t3VV/7mZW4SLTVKh/uXXwG1NvjHOmDKfMKaTomywTtoJ0xBbqmaYP0jCtvLHWjlgywzHJB4+DM=
X-Received: by 2002:ac2:55a8:: with SMTP id y8mr8800781lfg.117.1576243536017;
 Fri, 13 Dec 2019 05:25:36 -0800 (PST)
MIME-Version: 1.0
References: <20191213102600.12861-1-brgl@bgdev.pl>
In-Reply-To: <20191213102600.12861-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Dec 2019 14:25:24 +0100
Message-ID: <CACRpkdY8aXhCtiXmaQ0BFNatbab0b4Snir2k9maocsMQr33zbg@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v5.5-rc2
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 13, 2019 at 11:26 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Linus,
>
> please pull the following fixes picked up since the merge window.

Pulled in to my "fixes" branch, thanks a lot for the help!!

Yours,
Linus Walleij
