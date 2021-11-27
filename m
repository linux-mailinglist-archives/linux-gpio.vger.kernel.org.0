Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8061345FE8C
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Nov 2021 13:28:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbhK0Mbt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 27 Nov 2021 07:31:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233937AbhK0M3t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 27 Nov 2021 07:29:49 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C88AAC061574;
        Sat, 27 Nov 2021 04:26:34 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id d24so24765074wra.0;
        Sat, 27 Nov 2021 04:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:reply-to:mime-version
         :content-disposition:user-agent;
        bh=ZVpNyd0mzNNUOnBM8dPzd1QK96g5EKhMonYmTndc7Ck=;
        b=VtYK3nE2xAcco4nsad6s4cI4iRWjLwD08H7KGf+fKl6HwGht5GORw0OqvKfJ5kaWcv
         vlceF7tseMw0jNYTwD3vshl9+03jSq6y1EBSErgC9Dl5eeEmi5R/8uz8u+ZX8VEoTP9v
         iGTsDaIk50bhYhVju2C6MJwHI+q8CvGor2ClZ7ZXbvs+APnQ1Mn3/n5z28KrU+tltkaE
         H+ieltv8rCV8is5BIrKWxoZ8HKIfWlfywhKmu7O4G+pYKU9fGFTD/Ig61odcqPKHEru4
         87ebduBGr2EQMAjFs/SirKA0BgXVVWicUJP8DM49sDwZypjeFfzuMIshNrD9SCawb5dy
         K1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :mime-version:content-disposition:user-agent;
        bh=ZVpNyd0mzNNUOnBM8dPzd1QK96g5EKhMonYmTndc7Ck=;
        b=u01XppnW5BnP0usv4+5FzFvg5HUUONhkY5T4+54nz6pUkWF7xOZBVyiSezcUWwGDdk
         OAMfViDrTAH/iQmM5MBtGnhMRXRBQ3hmUdSoOaEwLtSgR5C/tOBLwFlr7pavLnGDc2c7
         wd1YDF0+OOC9C4uvyxIOpDfs4RP1ckdUpW86TX/v4SpGM8Tuhn1cmteXXKQ2zWYpFjjT
         BxzPE/ImeQsd27KwN0roInPa5AJGivskecJmEl7nkhs2AQc3D9zV23HH6Zm6ZUOMEVeX
         fW3uetDp+6iR9JIc5H3BKLQuAEoBUZ0S5nnkXzHDkE4W2BRl0/bmjbvFNxwPYb3AtXCf
         41pg==
X-Gm-Message-State: AOAM531qwxKKvMlM1C+OZJYB9oni8xv475g/N9lMoM/YyYawvRzYF6Pp
        ku4qMGrB3w/sD7emxxck55A=
X-Google-Smtp-Source: ABdhPJwwzUzSnLIJ0hUjrW+6Nls6rCq5gZoZdK6GAJKSPZhl+evtcfHhmVfsR7bWcRoTtD3XyQjvjw==
X-Received: by 2002:adf:8bd2:: with SMTP id w18mr19604194wra.557.1638015993456;
        Sat, 27 Nov 2021 04:26:33 -0800 (PST)
Received: from debian.domena ([176.106.33.180])
        by smtp.gmail.com with ESMTPSA id c4sm8340714wrr.37.2021.11.27.04.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 04:26:33 -0800 (PST)
Date:   Sat, 27 Nov 2021 13:26:31 +0100
From:   Dominik Kobinski <dominikkobinski314@gmail.com>
To:     broonie@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        ivo.ivanov.ivanov1@gmail.com, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, dominikkobinski314@gmail.com
Subject: Re: (subset) [PATCH 1/4] pinctrl: qcom: spmi-gpio: Add pm8226
 compatibility
Message-ID: <20211127122626.GA3798@debian.domena>
Reply-To: 163797660213.2988101.12499295081195849746.b4-ty@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I have sent a v2 of this series (https://patchwork.kernel.org/project/linux-arm-msm/list/?series=586091), but forgot to set this patch series to superseded. Sorry for the confusion.
The only change that was actually made to this patchset was the commit message to the [4/4] patch, as pointed out by Bjorn Andersson. There was also another patch added at the end of the v2 series, but I believe it doesn't concern this subsystem.
I'm not sure how it should be handled now. I am really sorry for not setting this series to superseded earlier and complicating the whole situation.

Regards,
Dominik Kobinski

