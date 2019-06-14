Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA56C45D94
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2019 15:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbfFNNNC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Jun 2019 09:13:02 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:37813 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbfFNNNC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Jun 2019 09:13:02 -0400
Received: from [192.168.1.110] ([77.4.92.40]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MekGB-1iBeay3CUf-00anMN; Fri, 14 Jun 2019 15:12:57 +0200
Subject: Re: [PATCH V1 1/2] gpio: inverter: Add virtual controller for gpio
 configuration
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Harish Jenny K N <harish_kandiga@mentor.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
References: <1560315034-29712-1-git-send-email-harish_kandiga@mentor.com>
 <1560315034-29712-2-git-send-email-harish_kandiga@mentor.com>
 <CACRpkdaSLwELtWMiEvYRBRF1d6E_9ymupdiCe-rEaaJkCfOd4A@mail.gmail.com>
 <b56f84bd-6f31-95ff-427f-1bf0dfa27421@metux.net>
 <CACRpkdaGFw9XZSW7ise5EBun8ehikNMzw4BCs9hByme=6z4KDg@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <0bd09e2a-5006-4587-056e-9aeb6b05d18c@metux.net>
Date:   Fri, 14 Jun 2019 15:12:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdaGFw9XZSW7ise5EBun8ehikNMzw4BCs9hByme=6z4KDg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:D6MGFCXgPfJDamb+/0oZSvJm8GgGCd04tB5JL3Sq+0TRUT7VmXI
 PDlOe8IK5wb5V8Ki0lMBrk6xdEcEePW+X4ZPOCyNZ8XZp0o1+RJm4QHT6/fYHyQRVNvI+1S
 FdtG6s+9E5SDITOeanCpzidGi+BGDlX8XV/INlx4VWYD+Hf+ZlFmbQafXQKA7M40+crfedu
 VWnAs1zMYBxd4o0vyyG0w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:65YcqJmQ25Q=:m2Aj14aH25QKgfJl8NsvyU
 Q690luV/1CuHkmha0N+kdQV93Fu83iX0ecKUKYaigEVyxx+jkAJ2ER7jCk6Fpf35IPiiNK+1u
 4luZc9u0JcrfaoxV6tq4lAG3GBrfD4PJ+edMzw7u93Ap3kX1QUdycdDqpignrSpFk6YGTZHql
 BQWwjM2WuMv0aF/xJT2KJQgf+NikQz4JJXO29mvTgCyGBCT1Kei9tdjGbqY9hnODOJ1/5Y6s1
 YJyrpCHhl5L8LWNcQcj+OvT5vEJi+Jgo1dcClEwlFv+WK+7rS4mh1VJE3jBWr2uZggQ+KEtkN
 nAhhPMOsjWzXIwQNKoYYCKlrVfWLTPuhkFzK2TY/BMI3a85S+HDbwse1vfQTRn+TBr6MKf4Ux
 1KNrHgMbv5SAYIO5mH5RDEBy/w3+KxlB0jNjejBjDtlvtZUkSnD1tDvRoqxVCBjn6mPav5zvy
 jYsDYVWSrHzYGtlJo7t+uMS+lqIuByvpv/EexWwcDo8zmwFCRv45LaIiGCPfPjti7nZOCMoHz
 3Ocu9d2GQwIn5Byr1UKlRjNbWwpwV4lNsCs8yJgGffpwLKga+XtRFDj+2jvTTOhaXNDREt/ZB
 Aohun1SAuk+D02q8AlqLzD2w/OmUZIpNXbteYxkNxp6b+cCLPuKjRtoPGYNrb2bDzidM5NptW
 eZUcdK3+V3nI5J3d3g7maNAPsWxBC5yaIUYeaS96P2ZdfURjMmSdO4btEp7QZa7K1Vnk+Vp6s
 OwkGWvnqX7PN713B995caG3pnHrPyrHpWQSu5qC2wFRiKmP1k36ZHGyIryI=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 13.06.19 23:58, Linus Walleij wrote:

> For devicetree people mostly use the device tree cell flag
> GPIO_ACTIVE_LOW on these to work around it. But there
> are some cases where that isn't very readable.

hmm, do you recall any such case where it isn't reliable ?
What are the problems here ?

Personally, I've never had any problems yet. And already had a bunch of
cases where the gpio lines had been used by other drivers, eg. relais
via LED subsystem (yeah, not really semantically correct, but we don't
have an ralais subsystem yet ;-) or gpio-inputs, in opening contact
circuits where logical 1 means electrical 0. Whether the new inverter
device or good old GPIO_ACTIVE_LOW should be used here could easily
turn into a long philosophical debate ;-)

Perhaps the inverter driver could be the winner when variable/replacable
peripherals and oftree overlays.

Are there any plans for removing the GPIO_ACTIVE_LOW ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
