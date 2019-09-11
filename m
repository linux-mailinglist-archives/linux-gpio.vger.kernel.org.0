Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3F8DB05D8
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 01:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728253AbfIKXGT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 19:06:19 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35703 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbfIKXGS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 19:06:18 -0400
Received: by mail-lj1-f195.google.com with SMTP id q22so17153308ljj.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Sep 2019 16:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7883Z7ac+Slfbx+cQ/2DuLT6CRyOLfw8ut+c4CPANPs=;
        b=stvvdzBxZQFTptGzgB/17WFhzTnI1B5cqiDZnDkMkXANt53ZBZnICa4KmgDHALXJ4Z
         ceqxJg6ZCM19wPr6NoqVAfdXmq92wMFSjhrjO/mEvPHbSPEL2W3tY5Pp73XBcwlJbLS0
         2WuWg+Cap9oK26ETQLk2Gq3N1LqEEniPaHLY5v89o0+3ac4Bd0L1B9/UUVZCiQ4juLNq
         VsZkeRCO317GHUAKVV3p70wbMiN5fnxDXyY+gzY4KR7g3vdXSpHVZNxxoF/dUAmCxcR6
         TDMuzkmGqJp1h/YjGE0OdZXSapzBN6SNO3tNwfFqvcn/VPBFewtPs7ZE+wP+kw7YATpa
         ensQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7883Z7ac+Slfbx+cQ/2DuLT6CRyOLfw8ut+c4CPANPs=;
        b=oHSsuegdRtjbK2d2VyAIZx4QqDdEKfnbVtfTB4ZFeD2Ak49VMIOR46cnLCBTtspzU+
         333+04VsUqBfqQOpP/r+iA5LOV3UkbLIQC3evxjFx5S66GrJ2yV9vt9G1gDt1O0cpoc5
         5GF2TFc5DQR7XDReUoo5xZqOoDZdNUjhioaHE8VSMi8g+1DhZeN7xNWMv9TnDhG3kMTI
         Y+d36v49WbsnqoOjHdkbb1m6hHEB6b9f+tbmNscpM434/s/MZnpIUgwfsioZtxpZCmub
         FQM+TkoqDeNJpvpkcOo4egc1mBOB7kkNDC9YrMnCdKrx/VR3J8wuvXd7i3X1QIzNA6nx
         X2eg==
X-Gm-Message-State: APjAAAXtwN4oyMorOqTH8TucMd5TZdkcNkqhBUixRnQNqHAabSA6x6UU
        mLZsiO8H1FRdQS9H1cCaNu9i4JCfZs+nwAARY30X6Q==
X-Google-Smtp-Source: APXvYqyIytBBqNqsUppL3242vttfgTVNOPFJ1CgaZu/wYMBC5ORTHbehk9CWW/zvK6SNx3rRlGlpknUWJWHBMsh8L9A=
X-Received: by 2002:a2e:884d:: with SMTP id z13mr23708970ljj.62.1568243176898;
 Wed, 11 Sep 2019 16:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190907173910.GA9547@SD>
In-Reply-To: <20190907173910.GA9547@SD>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Sep 2019 00:06:05 +0100
Message-ID: <CACRpkdYoY9nRGD+4m7yzSci5n0YS3XeL+tgPDKWuaoqh3GSTyw@mail.gmail.com>
Subject: Re: [PATCH] gpio: remove explicit comparison with 0
To:     Saiyam Doshi <saiyamdoshi.in@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 7, 2019 at 6:39 PM Saiyam Doshi <saiyamdoshi.in@gmail.com> wrote:

> No need to compare return value with 0. In case of non-zero
> return value, the if condition will be true.
>
> This makes intent a bit more clear to the reader.
> "if (x) then", compared to "if (x is not zero) then".
>
> Signed-off-by: Saiyam Doshi <saiyamdoshi.in@gmail.com>

Patch applied.

Yours,
Linus Walleij
