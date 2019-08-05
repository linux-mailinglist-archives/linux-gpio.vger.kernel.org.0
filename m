Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC7FB81571
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 11:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727889AbfHEJ1p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 05:27:45 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37640 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbfHEJ1o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 05:27:44 -0400
Received: by mail-lj1-f194.google.com with SMTP id z28so24479159ljn.4
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 02:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=miq5LJnsHycKAbKrX/aqmgv81qAV/3Tn1hYeTeovT1s=;
        b=EtR7cxMhkbo7QWXknDztSh3qlAqEOooXAsGcenCHLESfVSPbSJWe0po31TRFEGZCIP
         fbQ06k3afzdBiUxV4RZbezu+E5YrrIXsxeOFDqDVzK0lJkRJ0/Vx6GU/Es+xagKNV/PF
         uerC3lf6diy5kPWhdalSC/w682CwmdsKYqbEZHz9RCwFxmK2MloL0OZ3SozE+GuKGAvc
         7vMUN6fGY+7VdYhwHDQRHAYl7E9GxcsgkRw9VUaH06UBlMiXXsngXurrle9rXAJwquJA
         6Oy3ra3Yqv7j9D0RHZ28Exk5bHTmk2XCYGAAjypo/3LtY5/0lMJV6Sxbp++wNWRVYSUB
         Rf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=miq5LJnsHycKAbKrX/aqmgv81qAV/3Tn1hYeTeovT1s=;
        b=Rbgxuty733+EqmI9zpOdnJdCQ4x8FTW94RzbWquvmiWGNod8rMwrbrUTpzTNcn5nG4
         icF8R6ViswYFsSDM9BcUoe8SICGq/j7i8kNKV2xc6C5+4mX/TxX8S/CFjiJ9O5hDgxZw
         lcwO7pHZCnbAZmRuzrm8hlkGXbvlKQT/b6T8Oe+5bv5yskPuFLkM9I/cE0nuul+oJzbr
         1oIx5YY6WvS0ovaP01qF7TWM+3CuZFoJVqIEYf4y5ka1IsVoyp9siMYSjZB5fPSFHy5T
         MDsNA9PTy/H7bUe32HPFbUUrDnZRyo468MhvzY2slMBgRCmBooLO8omaWiyIB0nSBl5S
         uZew==
X-Gm-Message-State: APjAAAVY2+bqJXzM9QZET5T1qREYp1KHwH4VrVsogo1EnbcBQSdmzcfC
        BHNSV6syLJR4udXUywpct7ss9z/pf95pzorNt4+1ow==
X-Google-Smtp-Source: APXvYqzZZ+BV1zGXdPbqQEmcBkpwiyKfdqckHRWRksBBrs7TwsFvmAQry9T8pnndwRc5cffdFpZW/uNyp6Z0yYoRD50=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr14713714ljm.180.1564997263156;
 Mon, 05 Aug 2019 02:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190721125259.13990-1-hm@bitlabs.co.za>
In-Reply-To: <20190721125259.13990-1-hm@bitlabs.co.za>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 11:27:31 +0200
Message-ID: <CACRpkdYy+ZbcxwswOx9WWemmsSUcWKdLRXDGKeYkhbC2UYGGKQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] [PATCH] gpio: Replace usage of bare 'unsigned' with
 'unsigned int'
To:     Hennie Muller <hm@bitlabs.co.za>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jul 21, 2019 at 2:53 PM Hennie Muller <hm@bitlabs.co.za> wrote:

> Fixes a couple of warnings by checkpatch and sparse.
>
> Signed-off-by: Hennie Muller <hm@bitlabs.co.za>

Patch applied.

Yours,
Linus Walleij
