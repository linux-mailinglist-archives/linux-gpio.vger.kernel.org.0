Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D408913BD5F
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 11:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729730AbgAOK2R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 05:28:17 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43378 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729650AbgAOK2Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2020 05:28:16 -0500
Received: by mail-lj1-f194.google.com with SMTP id a13so17924535ljm.10
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2020 02:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fl2+hd9MOPqIs4AdIyHBX9dTYx9KGtCqWmRO6vACTV0=;
        b=Br2os3ucvC2+tntLkVdA5cJ16P+fmWVjSbnj7VdWkvVHHxoK1LaEJIjdWDCHj8Ckgg
         +fAPPBqF/IXQSDKQeCVlV85ECsPEpHuoQpFgzYbBKEdu89gXKwwF9VFW5KTI3IRZPTBV
         cmfYoL+9tmZWzIotq6YCEPDH9s+jgKX8KUPwH7O/hlReD5KrNtoERgiAmioTyHEWQyzV
         XyMgTf0MdAfAnj2pb1mkEiz4jxmVhWFYdCe8hsUbRTx4zUuc+2JtWeK0XjntyENUxuye
         jeFGBOqjG+1YCYdb/+GRlNzshuGnIjEgep9owtQmkiLemZmtskhmuUwRW+GAI44HEW4C
         jp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fl2+hd9MOPqIs4AdIyHBX9dTYx9KGtCqWmRO6vACTV0=;
        b=p0s8GBH658r3MO0drbLJN1Sa90IvqA108Y+3eKoUmoh2kMLHV6qST/2p7BV6SJQvqY
         YXwnUEIO9Xrvvxfcq6+gua1EaGYxO9AP5uxPJUW1Az3ixZDz2h2HqGqNFlbIqxzLNBu/
         l5hNL9AhgHuRyEnRugYivlOHh028Kqffpp/leH3mLfXg02MeCFcOIuS4SqodSabODClF
         oObqIeMkfNti+kpu0DL3jGVttdOoEkJpkCYJXk6duiV0qxhPv4LWaXTEyr0uDJWHsvx2
         lzBoX6Lx4tE8VTVYAmdzP1zltOIq1SqwkBJP8Ynn9ciXhI1AR3nO4Y9wPPyC4UrpalzD
         TJdA==
X-Gm-Message-State: APjAAAVplprQ1uddUDudOziz8eKuf5E1ltsVCWr+FlQWaSSkTzRgBLfU
        Q90hbO4cBu1+1vB4zY9XLA701SQFyLHD5kHMYhlLgA==
X-Google-Smtp-Source: APXvYqxaEEPlzZFLh39WCF1YWNM8pO+8/3eb5wMYnow6KlO3Ow7rl0uvCV06EirMeY33Q27yWVMo25R0SKDVRfErk0g=
X-Received: by 2002:a2e:918c:: with SMTP id f12mr1346817ljg.66.1579084094788;
 Wed, 15 Jan 2020 02:28:14 -0800 (PST)
MIME-Version: 1.0
References: <20200114150253.28716-1-brgl@bgdev.pl>
In-Reply-To: <20200114150253.28716-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Jan 2020 11:28:03 +0100
Message-ID: <CACRpkda3QhVATZ5of97xDWYnAb6b1o+gMsKE6mDnJrzAUmNV_A@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpio: mockup: minor maintenance
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 14, 2020 at 4:02 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Just two tweaks to the testing driver: update the license tag to conform
> with the current SPDX list and sort the headers alphabetically for easier
> maintenance.

Thanks Bartosz,

I just applied both patches so you don't need to bother with pull requests
for these two.

Yours,
Linus Walleij
