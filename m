Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23BEA1053A7
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 14:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbfKUN4E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 08:56:04 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43196 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726948AbfKUN4E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 08:56:04 -0500
Received: by mail-lj1-f195.google.com with SMTP id y23so3291290ljh.10
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 05:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mwVumWvJHo4zvWxGZJD9YSWEBNd/DEDoZWc1zGQkww4=;
        b=PROaNuWrUKfIWxlt+j8KnAB87S9sEPRRC6XBWLZRSlLDbSCwpFFGXYtL+n3UhxkSnb
         zltboWUsjHwVXDG8sa1sM8NgJaHgZF4KeCpIkdAaZyRqZqCaHl+rYRUm3D8RS5A/EnCl
         Q75Zxx34KXOEIEj224cI+oGu1NFCGs7vdCaqpWbgqyBMpoIU0Aj/VrIffmL6710odHKO
         gULu3ssd8wX29tDvOdwwoYjcU1hc1jN7CkusvCk3jWPw22fId0+TqKLIYq975QXn+C2a
         qYZgtmLDvAJ/JMwbYbfP/gEoCc7fbYXQ3sWQZXg3offSocrRzpuPbKzNbGwTNdfiIcNQ
         +jFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mwVumWvJHo4zvWxGZJD9YSWEBNd/DEDoZWc1zGQkww4=;
        b=msucoo5E5im9j++JJbA0s491TLjKLqdp9JCYmEP85KvDd2hti1lIWlFXqqJKUvL7q1
         +iFH5MM7PhNjcoLUqbhT18wn4F137smVIDiQ9yTKVSkW1Dpd0jK5C/pU6/C7nAwrydwE
         zP73r7Yo3XUrZ1UX43d33Z0ER3kn/3s3azRXT3syvrbDYdeipuUqGOyuBtOCCd/mInK0
         iB1KUlOf3+bwplekJbuRjSWmSUreJBbUBFSBwdVm4Ov2NegJyxtlOsFR9gXQr3xFhchj
         jr54fZ/evCBVokjxVO4DJXF+QSVaUsCCnwSUX/FogniVfCjdUFUVyuU335KSKAL00wn2
         G8Mg==
X-Gm-Message-State: APjAAAXOU8dgbJCTTG8BD0nOWmPv/H6XCyqofpmiScyo4jbMP3+alXa9
        OPxFgrBuBPc9aT4bV0tVaQ+0XUHvQYMzBd3t8qIgYQ==
X-Google-Smtp-Source: APXvYqxK0E9D55XX4sJlFFn/xkAOM+O9uzYS51IiYbmsrxiwLu/M4n5FQGZais+eCToXwuxAaBgFfC8+x3EE7MMm9YU=
X-Received: by 2002:a2e:9784:: with SMTP id y4mr7671826lji.77.1574344562426;
 Thu, 21 Nov 2019 05:56:02 -0800 (PST)
MIME-Version: 1.0
References: <20191115155752.2562-1-gregory.clement@bootlin.com>
In-Reply-To: <20191115155752.2562-1-gregory.clement@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Nov 2019 14:55:51 +0100
Message-ID: <CACRpkda5m-h_v_aNGb5gAOH7-HSd5c+Oxdij=H3UwQG9-FusaQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: armada-37xx: Fix irq mask access in armada_37xx_irq_set_type()
To:     Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        stable <stable@vger.kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 15, 2019 at 4:58 PM Gregory CLEMENT
<gregory.clement@bootlin.com> wrote:

> As explained in the following commit a9a1a4833613 ("pinctrl:
> armada-37xx: Fix gpio interrupt setup") the armada_37xx_irq_set_type()
> function can be called before the initialization of the mask field.
>
> That means that we can't use this field in this function and need to
> workaround it using hwirq.
>
> Fixes: 30ac0d3b0702 ("pinctrl: armada-37xx: Add edge both type gpio irq support")
> Cc: stable@vger.kernel.org
> Reported-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Patch applied.

I do not have time to send any more fixes pull requests at this
point, so this will go into v5.5 in the merge window with everything
else, and then to stable from there.

Yours,
Linus Walleij
