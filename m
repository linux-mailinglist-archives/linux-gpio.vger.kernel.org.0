Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDD5C146B9C
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2020 15:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727235AbgAWOp1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jan 2020 09:45:27 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43710 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbgAWOp1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jan 2020 09:45:27 -0500
Received: by mail-lj1-f195.google.com with SMTP id a13so3695295ljm.10
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2020 06:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ie6f3s1S9Jz3BeZ/mmrxn819AmEwvr8N8cV1sJC01n4=;
        b=jTb+IBbnsgneHG4KdrWaeqaY2OTJoe0dxHrLHFj2oP91Z5KgkamZ22mO2NTvxtL2zj
         NfkNcQQTtVAnwjYOJwVCNNktX/tgu0ZAQfJIBunGxUYYMiwBEnprpJj23oHyq4r0F9Z+
         j1xZaIE9iymtQzp+jdhO9hD6HqF6kSK+M8iPmVzzDgI1qOaNRmz7nG8TE8tZGDVdCcun
         ES03p/nfvFIjodyYWuXJU7Z3quN8rUCWWIAL3Mt+ggb6ZqGmsvBmhcPrv/5jx2xz/TaC
         uIs+d+CS0M85vt47JSto+F/wCzyZG3jCfDcDr4s8RbkqkiuJMEGUJ3TM2J3gOLrrUNCS
         RkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ie6f3s1S9Jz3BeZ/mmrxn819AmEwvr8N8cV1sJC01n4=;
        b=JUp1OfFn2nOB4jFrvG0czlC26jg3lD2kRyIyaAT21KgbeRLD7b3IDO71OSQDuLHhoY
         48qtntnBCFsZ96kcsPE0pRHjkZ4KgpsYzpyCHhDTgjmwscBGejsvLgVbnOzE6iHyBq1G
         2IuddF+BpF2wzPmQ2lH5NG18CpbWYmNfHa+iHxdHKa61RrOjtWAfwApHyyMSls2I+J00
         lKDFiGVvyhPgjJIYO9Gzgx2g9dVguq3+t5QqTyNYsBCLXH831nM3wC28F/E1kkNYVCPQ
         f1p1tQi1Rn88rb9s/QeGVbfMvd17I41t0b/d+ZqZanWa7bwtFg/PDj0r+qvtsp2yX1ZU
         l31g==
X-Gm-Message-State: APjAAAVITimqZUaK1GC/HTpQuxmzbSr34gyH0pCydsuhD7FenmOJr1PF
        oQg66OkH80ZylaRPc9gyreC7Y8fvo+vCUb+KUtSGcg==
X-Google-Smtp-Source: APXvYqxco/rNDlmOfsfWgkvUHcMvuff9G7rOjEhRXWl/Ryt1PaeZ+cSINySUaCbopHTQcV19dsMU4q1C2hJVCoF9ZK8=
X-Received: by 2002:a2e:98c4:: with SMTP id s4mr23313388ljj.102.1579790725283;
 Thu, 23 Jan 2020 06:45:25 -0800 (PST)
MIME-Version: 1.0
References: <20200120100957.GA11113@black.fi.intel.com>
In-Reply-To: <20200120100957.GA11113@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Jan 2020 15:45:14 +0100
Message-ID: <CACRpkdZh4Cy83BPfdgcXR6idf7KCr15VD0YkR-7CcDxV=HZgaQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.6-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 20, 2020 at 11:10 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Intel pin control drivers update for v5.6 (next release cycle).
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit b9a19bdbc843abd659e8ec6b1b3c32ae3a2455eb:
>
>   pinctrl: cherryview: Pass irqchip when adding gpiochip (2019-12-09 12:55:53 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.6-1
>
> for you to fetch changes up to cd0a32371db73d0b50536a7ca4f036abddff0d1d:

Thanks Andy!

Pulled this into my "devel" branch for v5.6.

Yours,
Linus Walleij
