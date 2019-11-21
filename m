Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE7D10531B
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 14:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbfKUNas (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 08:30:48 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43424 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbfKUNas (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 08:30:48 -0500
Received: by mail-lf1-f68.google.com with SMTP id l14so2635848lfh.10
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 05:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IE/mSIHCS6Xzqc/gnmcontcARisX6qSsyZhD5OBDDxk=;
        b=ZNbyQlFH598mwO3ZTk5Bxn3kHgW45I5Eu4WUNMx5IeLt+1WWi91LPhitJelid9TP6m
         jFurD5HZKF+p+y6IyIx7IZlrYiwEfBl5HME3fnMmF/iWw2vDF8zFSLdrYkgFGCCUOIBW
         cnPl9ikRAM2WDz4bMmYTYZ9ZtLERjhoxn7AYOhX2kVyN3kPxnye4ZBFjTxTtfZUBjWbH
         MMoS3TyQpAz/0X4PnOBet7GiQ55CjP2cSHTH/q21O5aqoiVST6qWBLTsgSclacOEVUN1
         lhO2DFgb9qdwdKrFDi/GL5K+gAPTyQNNGqMgQstWqKCUCdCk3HrWOXty1KFY9LxrQyeV
         5GvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IE/mSIHCS6Xzqc/gnmcontcARisX6qSsyZhD5OBDDxk=;
        b=cxHCD4p++Zx2jqgpdzU3PU8YTFpIfgpw1c0yHy/rMWdny7cfPv/WSHun4ny60bfrdg
         FggNwQdmNXq+lHKi3/HLCct84i4LPvE5A8cKc8JmgNyUGV4HB+EQBKY4I4fmdksJrqSW
         FkPRxtSaDJoGPeF0h13p0KFsOPfVp50M1hY51k5rO34iDK0VcRG/RVDH3UqP55td83yR
         +A88IUBEeYPetXhXPflmTkA1GgnJzALWkSBWBBn9WH8L+V6lAITwJ6AR5it5veD2NiDd
         dzfuLItUw+19lM3hLI4Z8mt6w1bdi3GMZ0n511p6oDV6ARtw2EdVaYPlgT2emKAMwzze
         mK+A==
X-Gm-Message-State: APjAAAV8QDBGQsqVQJUGG6XbB7Y0C6+tFGuKF5ELpk1N71fdk5/TlcWV
        nk9hIeYquoQnpNWHfyw/36GeXK48mBxmxpergefiog==
X-Google-Smtp-Source: APXvYqyAqfUjFni4QDLESWfgKmg3QFlH255M0JhPXpWJm4ZWCVH8KKzBQC6wzfjb2kein9/95LrmLPdNUXOGYZC/quQ=
X-Received: by 2002:a19:f701:: with SMTP id z1mr2623741lfe.133.1574343046644;
 Thu, 21 Nov 2019 05:30:46 -0800 (PST)
MIME-Version: 1.0
References: <E1iX3HC-00069N-0T@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1iX3HC-00069N-0T@rmk-PC.armlinux.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Nov 2019 14:30:35 +0100
Message-ID: <CACRpkdbOQdr6e9xC-+XB-xmP14xyg7hNKRjPPzXo3ouTqw7yng@mail.gmail.com>
Subject: Re: [PATCH] gpio/mpc8xxx: fix qoriq GPIO reading
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 19, 2019 at 2:10 PM Russell King <rmk+kernel@armlinux.org.uk> wrote:

> Qoriq requires the IBE register to be set to enable GPIO inputs to be
> read.  Set it.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Patch applied.

Yours,
Linus Walleij
