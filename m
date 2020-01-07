Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06EBE1326C4
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 13:54:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbgAGMyj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 07:54:39 -0500
Received: from mail-lj1-f171.google.com ([209.85.208.171]:47064 "EHLO
        mail-lj1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727730AbgAGMyj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 07:54:39 -0500
Received: by mail-lj1-f171.google.com with SMTP id m26so52136576ljc.13
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 04:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dLQehnIGTRtzNAywjRs5kFO6zHUUUI3tTZN21RU/D7A=;
        b=JWTdHwJQQlZJKVXrfGbinu7miD5f1KdVZThrff5wDW+WEpHv+Up1KIgHsn6Wn3Bba/
         X82P7+td1gsCfwirNWEzipP9oR5wHgwlQNczBPE0/2clI+a5kKKi2v/dakUlmQBnkmS8
         M8a3QoF5I0eCef9vcPI8Uin7BwM0/oOOj0ZrSP22/xnJYcgqoR7ypYwOqy5ayYFD3CH0
         du9p5nSkD81FEgwy0Px1d8yi4rQfIb93c4wqkpHwKaLW1xPDyonsorbF4x14jjD7EVP8
         KyPyndSEUUVWA2OGxGTqEpRYaYBcFn5amf2ZYTqGCJy2s8E258UZZ0xp/54WWT/D3N62
         32qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dLQehnIGTRtzNAywjRs5kFO6zHUUUI3tTZN21RU/D7A=;
        b=Z9Aoh9jQn75Tjitn0intNOXLil7TVMTNfB8xdTBLaAhcYSyXh3gpAGGWL4H8ElVuzH
         2fU1XJ/nTTdQm2yTb7b2/N+6LsAMgfiSSOgwzJooFBHmDszRRZwMC6AD7ljsZFFRBPQI
         aJwPQfwbZ5GtqsjtKVNqlQgJHu9QjqDux1HQHATYYEeOSloBWpNug3xF3yDHmaUTy9z4
         X+G1Qvpf2MNCdtXeJkC8fXXPag/POFAj/j+Hrgh3lq1f1Kc+8NK061pz1QijQyagzZjO
         fZkWT2CgdiAJOkIP5lUKxDbTCL20Wrs3PIrRNOA3gL0Q1jdC+c9Iq+Tix+B0Rs6PmaW4
         7J8Q==
X-Gm-Message-State: APjAAAUWL2c2JSkfh5h3Xqa7B75UylLT7GG306kPvEfHA1uhT4/Y3mVl
        HeUkOngzJHuNtk42QSFO4B5d1w/9SGuSSl2wiy3rK93HXTQ=
X-Google-Smtp-Source: APXvYqxVLk2ecsyGowfmnTL78wYC4MFpZZbsVLEtojp/57eiRcLuq5kHJN8I+Gav/9y1t2EjG16W7XG17KgQMlKK99o=
X-Received: by 2002:a2e:a0cd:: with SMTP id f13mr26298721ljm.251.1578401676846;
 Tue, 07 Jan 2020 04:54:36 -0800 (PST)
MIME-Version: 1.0
References: <20200107120553.5620-1-brgl@bgdev.pl>
In-Reply-To: <20200107120553.5620-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 13:54:26 +0100
Message-ID: <CACRpkdYYepw3dJU8Pz+KdptPB+Ok+n=b7KYDrVbq3p7DCL=LKA@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.6
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 7, 2020 at 1:05 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> as discussed: this is the PR that contains the cleanup patches submitted
> as part of my series adding support for watching GPIO line status. Several
> other patches picked up into my tree since the merge window are in here as
> well.

Pulled in, thanks a lot! Now it's time for the autobuilders to play with it.

Yours,
Linus Walleij
