Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C80415BE41
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2020 13:08:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729843AbgBMMIH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Feb 2020 07:08:07 -0500
Received: from mail-lf1-f51.google.com ([209.85.167.51]:39145 "EHLO
        mail-lf1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729532AbgBMMIH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Feb 2020 07:08:07 -0500
Received: by mail-lf1-f51.google.com with SMTP id t23so4092595lfk.6
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2020 04:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fidvFBToXOSRfCwtXu06FzRuSCQGhae822Tfztq/Tmc=;
        b=TzYbSRlgM8Rnm90kFlFct5oupxMjVYEn6R8M/t00JBUUJKH0h7yC1TFwEOwD5DLndN
         2EoV9moGJZYkS9QRyR5gpY4feO2T0j3zf+H324uAqKcRWL0XCQ4fF/uygipLWOowd1Ds
         /aBojVXOjS5WKSXs5I+oPvapvK6P8ifgZkdwbnNaPs61yiSKHjVqQJucT+8nVMHL5/qK
         t6aUn2AMqNr/RbIsw4diBlKxEP42yMiFYmQDXIiNdEez1wYa2kOyNX+7qztVwK1Q4TRN
         5+wwiW8buJuxJGpwtgRQvr+H0FHsJBr6zfMck6CsCy2F1XbuYJEKA6V15QcrZrrBqKVY
         nlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fidvFBToXOSRfCwtXu06FzRuSCQGhae822Tfztq/Tmc=;
        b=sRnn8qXeiSmrhWGPmYJN8UgXFPhh4f8MIFwzBoXn0Y1zllqnjt5yAILM/oZixaUMMD
         2yGsN0//+uChEExbCoF5olTn0oE7SPz0jOPkp4ZHXS0nuxnSvIwWfBN01Sq5rCEWNjja
         XeGl0k1xtoyzXwR5vFO2EA/gETTIsWggqcrykC3gSlaVszJIVkqzLDg88WjPTLru+wJS
         AAV+FW+sxfGcnm+SNIbf3ILJHFaE0LarVx5S7nfzWc751zPJ0qts9B622TtpIzVaxzbj
         LchHSGYj4ZpRDjsksUK0asOmXgpqKFXAaom8u40v1WfAJNv7Gq4af6itfehwxlsrCyhq
         7nUQ==
X-Gm-Message-State: APjAAAVGCsLaM0dB4sE1+TEKaTRH9zihdjdenV0vXaUbXxR8TX2W8XJn
        SLQ+0k01+iAK2pEgUzGcPQ/elWkN+tME6G+/zd1IXx+GpSs=
X-Google-Smtp-Source: APXvYqyZ9CwfqSNK+sVeVXA/ADwBHffup3aFlgHPly3fXXHCj1Ptm47gVLkB8cFhglaMyduD128PBI+MlWoYBQmPctc=
X-Received: by 2002:a19:40d8:: with SMTP id n207mr8823174lfa.4.1581595685491;
 Thu, 13 Feb 2020 04:08:05 -0800 (PST)
MIME-Version: 1.0
References: <20200213094754.17808-1-brgl@bgdev.pl>
In-Reply-To: <20200213094754.17808-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 13 Feb 2020 13:07:54 +0100
Message-ID: <CACRpkdabq_R6GzJZRztcoC+pQep+0TRtowHbHBhgfOXcipHTrQ@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.7 part1
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 13, 2020 at 10:48 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> as discussed this is the pull-request containing the line watch ioctl()
> as well as a couple patches picked up during the merge window. Details
> are in the signed tag. Please pull.

Promptly pulled!

Will push for next once my build servers agree that we are in good
shape.

Yours,
Linus Walleij
