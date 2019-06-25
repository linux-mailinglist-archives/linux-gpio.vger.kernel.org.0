Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31E3554EDC
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 14:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727485AbfFYM3m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 08:29:42 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46654 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbfFYM3m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 08:29:42 -0400
Received: by mail-lf1-f67.google.com with SMTP id z15so12450670lfh.13
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 05:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G0Luw6kS3rtmPHyXIdp7WMOp1bPiSBAU3LeaiAX/EN0=;
        b=K6lvWqHQpd3miV1mWXICKy+NYshDX8pKbTnjkrUtEov+KkP5iAVpTThjISpndNgBMk
         sFh2aaMEWhtCgL4+oVzIZ0FbuUs3/hu/ztKQauj5szQpPqcCqJ/YusxczDImJOh9ofmt
         5Bi3GLd7t2zDQIBDq3v1lBpDfCoNbCG9taQdzQB2TZim5MBOccEeuOPbvpH43skp9P3c
         oXROF8JMi8renaToVycTML/26UnWj8S+rgI64csH/zVgzESWbhSLP+IgLdv/fdU6dx+q
         eq7zZ/VaWgyPIBDbnmHu+YpfRM5q8NTSTXmA34JTZa5enJ/b0YFDcmY54xw24WiJUDiy
         LhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G0Luw6kS3rtmPHyXIdp7WMOp1bPiSBAU3LeaiAX/EN0=;
        b=QppTGKcKIEg/AzIwbug/Li2xHapgYMZIQFc6qMiyxffiGpa+Do0Jr3GBYTtNmp9c0w
         S9nSomu0veqsj013ueTy98Pr/aOM5Oev/Y6dOAQVFR+X7JukOfEqz6tSbYZSzU5pst3f
         T7kwFUaJ8RWNTCm5sBrS5Z8Lb2G/jAh3Onc9muJWGrn+YSoh11XRIct99Wv96ARJnKh9
         PWKvuiXO5zfETffeZu0gBFC1CX8W9ONxVCigv7eFdek9uBCrCsOx1rvvr9M7gIbbGjZl
         L33mAwOY28NwlWQgZUlP24ujWs75gZKKs/w5kZgMJsXDsnuXLFewhQtQEtJYxCFqGCIw
         4VCw==
X-Gm-Message-State: APjAAAXEtxoud0VT2UbvAJTJOW7yt3nIvJzrDONoJS6W1L02/iBegPHP
        96h5i6hRVKIV93BFqlrlhjSTa/q3K7GMWdgIo3XFZw==
X-Google-Smtp-Source: APXvYqxp4Ybz6xLVOuXOQ4VdxIJTjntcvEBOufrhMb6lXYdwk7tEE5wJsxyV5ft2eb6OhoodZqr0/tV2TMEMo3G2/2M=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr2458147lfh.92.1561465780431;
 Tue, 25 Jun 2019 05:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190618155047.16894-1-gregkh@linuxfoundation.org>
In-Reply-To: <20190618155047.16894-1-gregkh@linuxfoundation.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 14:29:28 +0200
Message-ID: <CACRpkdbLOjEL6MQUYw=9yNyNRr0tsSp0pqZPGLb8vnrNEvD1og@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpiolib: no need to cast away return value of debugfs_create_file()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 18, 2019 at 5:50 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:

> It is fine to ignore the return value (and encouraged), so need to cast
> away the return value, you will not get a build warning at all.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Patch applied.

Yours,
Linus Walleij
