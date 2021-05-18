Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B88A388364
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 01:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232735AbhESAAt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 20:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232153AbhESAAt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 May 2021 20:00:49 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B918C06175F
        for <linux-gpio@vger.kernel.org>; Tue, 18 May 2021 16:59:29 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id o8so13507461ljp.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 May 2021 16:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FO3YkEqEyjs1RJpseSgkPGnb/cB2HIYztWmgztzRMQM=;
        b=M1Bfb1JeJsm/aVXM3tdky4SbmPu+3WlIhNIKQhNKxU4tIjHHaPGSp/HLQrLlrnqbYq
         ODP3/4X2mcouf8Mz4SLfHp8VOIQccFK395aV27Io8Oaw2QMHtq6vzzsCoEpveTdoK6hp
         TsDfr1TUj/2sc9xa6eYxu8BFIoeGBAhmWefQdvD/opkx6RlPs9PbJCLuQxIBP4X8Gb08
         Xyh4ZW3tPzAfY0R+auxO/LNIz9RRztbkXOWo3OQA1PBPNSinGuWvSHoli0iAV3RcjEE1
         OuFvX2NLLiXfQoYxZ0EeLxvazz0TVfanZeb2yLAq0nVqMp/ZpNpKzyFVMFCDh29sztEE
         vKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FO3YkEqEyjs1RJpseSgkPGnb/cB2HIYztWmgztzRMQM=;
        b=sMnI9veS9Oxh79oEHg3F/Y0Tija5Uzc0j6s4r+VWFSbC27BrnXfsA26RjticOo0gVx
         EK+bBHvOl2c4q2QSjeY3FLnN1o6ZYHZvauWgEOa93+BvVdPHAxIRt4S6RUPp1/R8XR7P
         ekjHndNEha5o84pkaPUsqWTumB0gQupGkY4MVha3a/7WpyglYZMHHYOGGELjwEq9C2F+
         jSSMoU98rqbRJaBIdLhjtQlJnCPRf2PtBmyns6l2v4D8wcuUX4wis2HRHAo7MyvE/ykQ
         6P0fwMaemTpHwBS/C4PHYEpaWrQc2czYKU59WmvyrxglhTR4CGf3CzddYTYKBAIG7Rh/
         wslA==
X-Gm-Message-State: AOAM532T3RlLcTaFYYQpxj49/n1yEcMAX4uTNbtftmJeYQBBqkzSZIlA
        x1Voas6arHF4HnrY29lpJM6IXpgUlB2m4MM6/m9VMw==
X-Google-Smtp-Source: ABdhPJz5D+5si+/+qaUM7Y8VvYKUH6TeEnTZSitWHlnnNZLvd7I6tLcp1R33LtBI26GMqqy8LiIURQc0OPirwWofi+c=
X-Received: by 2002:a2e:81d0:: with SMTP id s16mr6237018ljg.74.1621382368033;
 Tue, 18 May 2021 16:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210421082928.26869-1-zajec5@gmail.com> <20210421182041.22636-1-zajec5@gmail.com>
In-Reply-To: <20210421182041.22636-1-zajec5@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 19 May 2021 01:59:17 +0200
Message-ID: <CACRpkdZAVfMPep-DdFj8P2_6QDqPJ5Tm3RcWn5vPLHcP8bz0Lw@mail.gmail.com>
Subject: Re: [PATCH V2] dt-bindings: pinctrl: convert Broadcom Northstar to
 the json-schema
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 21, 2021 at 8:20 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> Important: this change converts the binding as it is. It includes
> dependency on undocumented CRU that must be refactored. CRU must get
> documented and offset property has to be reworked.
>
> Above can (and will be) be handled once every CRU MFD subdevice gets
> documented properly (including the pinmux).
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

This v2 version applied!

Yours,
Linus Walleij
