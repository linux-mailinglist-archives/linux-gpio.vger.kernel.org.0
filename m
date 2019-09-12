Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F626B102E
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 15:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732179AbfILNnS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 09:43:18 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40200 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731896AbfILNnS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2019 09:43:18 -0400
Received: by mail-lf1-f65.google.com with SMTP id d17so1532134lfa.7
        for <linux-gpio@vger.kernel.org>; Thu, 12 Sep 2019 06:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nZt0B3xrqHLHU4EvkiZMlrE7A5+KS8ARbT0ipn5PjfE=;
        b=jm6q7ISk/RfhVugAWF5YSK2afzSWJDBFxAi7oi9VZErcMD7Z1AukPdyibpKG5vTRe2
         jFmOIewoNoWhvEzTu8X+x7EZuqE5RgFfWm3QrjW9c7PRikJmv8w8KZZyC7lhn5ToHLsi
         8XpXAxjCiIU7RE4ufk8iJES4+77c9H0I6HlpdQdUX0nzjFrPt5P/AEtOMdDE48SUtVDA
         IMuBfP9lUYg0hfWM2zCvqW7YnBHHe1rBnGBF0zfYgc5u5c2j5sy9alNvTo/hs6te+GAa
         okus/w6Gb3Wa+mgHCt1IeKaxQmCg+St1kGqBkfGbyPfJQujHkOtvzQZ7U64Y+Q4RpTW6
         DYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nZt0B3xrqHLHU4EvkiZMlrE7A5+KS8ARbT0ipn5PjfE=;
        b=kyoFK9fTYNgT28shCW6Mljunu/nPlXueqpfT7kAykNJZ/R8EVu5f59avnoQ9p1mGwd
         t57Mxewc5jQ+/KtxIJb7e6MmM6e6YSA5ArDLSR8s18KDL3GQqFMPxAHe7qwlceulfmmk
         XTjC5yNRQEzAW1Z3htnonjd1dDuPdJAThHhGH7NI5+kRAJJR7tKMlPALAr3GOTxbGTlp
         qma868CdfiGXobWrmk8INhS+KESOkrc//1OvN+3YpzwRKUn4e1/R2/EdCuRqoRCPtoPh
         f+f3+lW6VkXUtZqsh4yZoryDz21RWMnikP3056F010W9E/PaZF9uA5Fcf5jzs0WL/HMi
         w6PQ==
X-Gm-Message-State: APjAAAX+zde5e021F3M+jRoOCqUVKIrjM3Ks8osg68hmIkCIuwkIrRIG
        W3bNmQ5nRcVPnyqFzAI+wntJa17oYGNJX7FV00NVaQ==
X-Google-Smtp-Source: APXvYqwunbF7TyfIhMcANFX4yAMKAnnsZW2NFILSXWz0Zd7gn78zVLaU+lihiMnQ0FO7JFF52e8A7qNnUVzqrPH/nXc=
X-Received: by 2002:a19:48c3:: with SMTP id v186mr27989255lfa.141.1568295796494;
 Thu, 12 Sep 2019 06:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <1567662796-25508-1-git-send-email-light.hsieh@mediatek.com> <1567663210.1324.3.camel@mtkswgap22>
In-Reply-To: <1567663210.1324.3.camel@mtkswgap22>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Sep 2019 14:43:04 +0100
Message-ID: <CACRpkdbBMiHk4DV3r=aLU+T+9bPQBLUiTaW6L+L=J=ec0guBmA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] pinctrl: mediatek: Check gpio pin number and use
 binary search in mtk_hw_pin_field_lookup()
To:     Light Hsieh <light.hsieh@mediatek.com>
Cc:     "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sean Wang <sean.wang@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 5, 2019 at 7:00 AM Light Hsieh <light.hsieh@mediatek.com> wrote:

> v2 is the same as v1 except that commit message is corrected according
> to Linus' comment for v1:
>
> 1. remove Change-Id lines
> 2. correct sysfs as debugfs

Patches applied with Sean's ACK.

Yours,
Linus Walleij
