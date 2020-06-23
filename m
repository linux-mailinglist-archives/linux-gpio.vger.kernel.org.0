Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 884CD204C5C
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 10:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731655AbgFWI2P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 04:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731579AbgFWI2P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 04:28:15 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57091C061795
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2020 01:28:14 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id i74so18160242oib.0
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2020 01:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cqQFfoyhrWaOKhFdJte4kkoxyTcLsH1iOwp2ZSE2I4A=;
        b=GvWgx0nmFgtq4mVOlqREkhgt9B3bR9uDfemw1u3w/4F/Mul89yoUcSMZdKNxfj29TL
         NThLta7adyrEvzzve2bmd6SC7DM3BJYBAWRnXotghNh5ECOzVu/IwVrPAGHHd7Or+Xv8
         lLvuSv6Whmcdo9peGqbqt5GwqDW7IJCKuB7Ud5NJV+cXEkMgnhQVtXlS+1Lpd0ikUl9u
         75Pl7/981U0+ilqEeMUS+gkZUzv+UobRA/a3cRedbBdv5iP7F36Dw8sJegadnFOvMG/l
         LKC95DMZO/JG1/ziHntOKEaCNXH/2gStRSeFZ6Ga5cdPIkBLJsILfshtpZ95bxariUHX
         m9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cqQFfoyhrWaOKhFdJte4kkoxyTcLsH1iOwp2ZSE2I4A=;
        b=t71toivp3nQlgHsHj/TB5CVFY8rspbZ2wC+bO0oayRulFtJdiNu5cQpNRi735ShR5g
         N7gFRrM3ATvePpLA5aq+yDjPIKDRqUkbqssC1d2nYZPK0lNdLK9O6NrmmaCitQZ1hnyL
         rarZDsnuZfJjWcGQgQ5bj+6LP8nZjEw9OCr/TgY9vCsVahYuc81jpBmyglkl9jELBUWQ
         3/S8Xmpn1t2b/lQk8bF6G8wTheZ4xH4rEmuowyfJvbtDg2BYA1z9SS13fyU+6ombyOc5
         iAvT+YrED2+qf4PnG1U1fArh3VXtjaoLWl+L+CzfXkOitBFKQdlr74J/FEdlito0yuM3
         PYjQ==
X-Gm-Message-State: AOAM531dmuRSr9t4dWAn454SxakEVBbT3t+vfqrcUUjOIciIxf3/wMiP
        vXx1+pmo+oPEoWtzAAeKBCIV2w==
X-Google-Smtp-Source: ABdhPJzD4ERSMBEMlRHS3xKkAJPfibloRkw/YqA8Ybl/aMA3r2xbBG9faEtstxi6XqowDI2FAqO/Dw==
X-Received: by 2002:aca:f58c:: with SMTP id t134mr14702855oih.86.1592900893663;
        Tue, 23 Jun 2020 01:28:13 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m94sm3906883otm.19.2020.06.23.01.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 01:28:13 -0700 (PDT)
Date:   Tue, 23 Jun 2020 01:25:29 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 1/7] pinctrl: qcom: spmi-gpio: Add pm660(l)
 compatibility
Message-ID: <20200623082529.GC128451@builder.lan>
References: <20200622192558.152828-1-konradybcio@gmail.com>
 <20200622192558.152828-2-konradybcio@gmail.com>
 <20200623072624.GY128451@builder.lan>
 <CAMS8qEWZ6hg1-n737ZDop6qsL4k3aNLPt_pJJqTwStNtRKhTcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMS8qEWZ6hg1-n737ZDop6qsL4k3aNLPt_pJJqTwStNtRKhTcA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 23 Jun 01:02 PDT 2020, Konrad Dybcio wrote:

> Yes, you did.
> 
> This was a mistake on my end and I realized it
>  after sending the v3, but I figured there's no
>  point in sending it yet again exclusively for this reason.
> Hope you don't mind.
> 

No worries, try to remember in the future.

Thanks,
Bjorn
