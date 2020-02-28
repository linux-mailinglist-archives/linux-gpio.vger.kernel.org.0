Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37C51174333
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Feb 2020 00:35:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbgB1XfT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Feb 2020 18:35:19 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33673 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgB1XfT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Feb 2020 18:35:19 -0500
Received: by mail-lf1-f67.google.com with SMTP id n25so3362879lfl.0
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2020 15:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q/B5228hYgmRnxW8FEHOYujtnQcsBZ77HbLjTHiA6bU=;
        b=Brro0fFLV4c6/pXJd1+hFk6W9NV+ug7bE06T2TmOrgmvdQNQmIHOeP8hNZE3verTb2
         Z1xvznUr/tTzwRtmCictcI8nYLahoAUKP3smcP9eoJQJXlhivQwZ97Nd5M41jI1LvEI2
         sAu+Arvz/7O2UqvHXdBTNBG9F0OFJiAvAsHpKlIuyeS4kFl5QMkS+8Uog7v3wSBScmE6
         D+ecYEzqsZXuMo8HKqofIW34z14M9sPH/0/n0WO70cHns3wrwJyII54liXRp2aXgPwlL
         +pHMoVyEqy9t81esObV7+mOyDDb0H21IWltmPhtToX37PUYJmY8oCBmPyMHnuwEQgqct
         SwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q/B5228hYgmRnxW8FEHOYujtnQcsBZ77HbLjTHiA6bU=;
        b=uC169J2M0hUZwUYHeCSGODAx+MwFxje7/4U6/2epN0sBkIizRrRrCfzDCpjuPTEW3N
         Wp4TEJFWybcTxFuObXiGPTr4dJcZW4Ne1ek+KFcPd7F29J6Tj0kaWkpoqlrQjcOX5jhS
         cVjtO/tqoM6xSXoq0ij2paUXvdZyg/qgVU5jdz6b99kNz7Y+LjEMEo3Ze8B/farMWJ7b
         Rd38jB59L51HjeAr0/4eFSPf4eE0P7rnz7hHTXgepFBOnffXazOisH8eBRHPlSMj1JCL
         mwDAp35DuHTIDLGvClkgRnYsBlIsyDNFCOsNucMnsJv5mp3MAGtZLhdNQkX9DSstftlE
         KFPg==
X-Gm-Message-State: ANhLgQ3yILjvkhcgk9naHluYx0ZLRjAHD8VmG9xF1CBuaYun3w1qX7OS
        bMAc1mkZg3gHWY2e7NMPssRRb+QzbeSl8QrFyZ72XQ==
X-Google-Smtp-Source: ADFU+vtIuJIvzeEGPCQJOCDVjdIQb9RIh3ENTmdzT57F23IJUb/aLmCkOO1feAaP/Yzj/kZWNt7ItmP7C6O/LKrqjeE=
X-Received: by 2002:ac2:5499:: with SMTP id t25mr3829568lfk.194.1582932915370;
 Fri, 28 Feb 2020 15:35:15 -0800 (PST)
MIME-Version: 1.0
References: <20200228154214.13916-1-ckeepax@opensource.cirrus.com>
In-Reply-To: <20200228154214.13916-1-ckeepax@opensource.cirrus.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 29 Feb 2020 00:35:04 +0100
Message-ID: <CACRpkdbhy+n-hMW8k+nWWMWgd4p3QFEJ-Ha5H1mSnuPkSfeFtA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: madera: Add missing call to pinctrl_unregister_mappings
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 28, 2020 at 4:42 PM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> pinctrl_register_mappings is called in the pdata case, however a call to
> pinctrl_unregister_mappings is missing causing the mappings to be leaked
> on driver unbind. Add the missing call to correct this issue.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Patch applied for fixes.

Yours,
Linus Walleij
