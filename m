Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9E3247689F
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 04:21:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbhLPDVR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Dec 2021 22:21:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbhLPDVR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Dec 2021 22:21:17 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 365A9C061574
        for <linux-gpio@vger.kernel.org>; Wed, 15 Dec 2021 19:21:17 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id t23so34558398oiw.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Dec 2021 19:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4nk6Vi4dum4Dtr6XVy2PhW6mJaB72PkT9o/OF4tXf5k=;
        b=uRUJvPuBzEN+FbXDTj7efDN+fSRp0Y6PhdoPNZ7UyT6TkQ1wCdOJCZs52w9qpX9To9
         MKPmH74jSbKjD3vlQvJaBVi22R2WIxp2VsTztsksXNM/q+A6KBVGyvWIw+Cm8b1wJz18
         8FGasmkG9+uj6fL5CLJXo9IfM5N7aOAUoocxJ8LFnHG0cyHMpMAO99w7Sroz1zlfVZbi
         aMd+ttMRq3NMDkCZ/G6HZXfQCTbaIdEQjx9kOWl/bMddJ65DpFEJsJpAXCI0n7LLquya
         6+9ZIYwhFNT1It9nR0X5CMnqmeSKEALoAKtM2XbASHu3BcZvioR4Ma/JsrTdpDZBFycl
         iB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4nk6Vi4dum4Dtr6XVy2PhW6mJaB72PkT9o/OF4tXf5k=;
        b=Dak7EBcZsX57375mWGBIEaeOLmOh7WUgkEJcIFFgI7dRch4jjDDRwWE89AzssVq5mk
         w4tIAdEu8Xoexi+T2aZiN3mHlJDpkT7KI86E/24LXWO0qLllrCt6g4Q4IYS1CINMHCzR
         AlzV8xj8fOjR63R4CLoEMHVQ0vLC+Hvcy8MY6Hywonv3APBbOI4t7IVLGjZn7+NVdwB9
         0azV/w2kIGEsWJCGn61g+CHflYTkzDhLIWBvdWxdkBrzAtEDDryFDZTkTecKyIZ7cWCT
         BsFRGxDPPjYLiXs/Xuc/K+1SRN0xavAgniqhLr4Wl6LMQNCOd+ZTxvQ9FdTBjO2MYU/v
         8OLQ==
X-Gm-Message-State: AOAM531t+3rY79ADHbtTZyCTDH0Vvr+o4Co1CpekVpqPcXHccZ0iiod+
        fq+GqekXyRdBb/I3EGY6gHl6+CKlbzEguQButrHWOA==
X-Google-Smtp-Source: ABdhPJxBG6G4ao7iRohWTlpEgDPSWWAp/AkOD0Tws/Zp6khRVkKS8EsKYwo5lMd8bkgOSbHWx82f97v1hO5QqDQfvsM=
X-Received: by 2002:aca:120f:: with SMTP id 15mr2614105ois.132.1639624876611;
 Wed, 15 Dec 2021 19:21:16 -0800 (PST)
MIME-Version: 1.0
References: <YboONMsLk8eUlvYD@black.fi.intel.com>
In-Reply-To: <YboONMsLk8eUlvYD@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Dec 2021 04:21:05 +0100
Message-ID: <CACRpkdZwJvZZ6pRg9PLFU8-71TwTGHtCsY_12Mjz67wqY83TaQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.17-3
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 15, 2021 at 4:48 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Hi Linux pin control  maintainers,
>
> Second part of the Intel pin control drivers PR for v5.17. It has been a while
> in the Linux Next without any errors reported.
>
> Note, the List of changes done against upstream that's why it has all changes
> listed, including the pulled ones. Nevertheless, tag describes the latest delta.

Pulled in!
Thanks a lot Andy!

Yours,
Linus Walleij
