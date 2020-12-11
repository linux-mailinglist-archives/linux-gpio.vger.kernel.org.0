Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBFE2D82B6
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Dec 2020 00:28:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407137AbgLKXZp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 18:25:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407172AbgLKXZW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 18:25:22 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10A4FC0613D6
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 15:24:42 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id f11so12861315ljn.2
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 15:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iWtjhfDyTxAe1qONwZz5XVnEPHnYv6xfPo6H7Tc/BVw=;
        b=Vrajfl8P/HOLhJzAyIH/Nn9gjOK5TystXzjE301eeoWyrn18Q9OYY9fxFtbjRQmya9
         NKNxQ/doA1mXmC95qeAUDFEWMwM6ycP0D270yFevKBjle0ixkUvfEo6Af7BQQI14qu6m
         tuicJ0t630IDCYxH1mmaPCQxuJh6g1IstZ9hjRoRsqHN9wQn9nS0WnpBJr3mo3GZQHC/
         zpuRo2tIKkW2SjUQBZ0ZxuquAehx7Jv03xCJebLS1tpyTr/HejaRBbuatfD+CZ+6fVKb
         dEWEIMz8gUwwZ7d4nNdYGle3DK2djxR2MDq9XwJILJ+imKbU7xx/El5Xu8RIumugoajp
         8evA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iWtjhfDyTxAe1qONwZz5XVnEPHnYv6xfPo6H7Tc/BVw=;
        b=PJjvM+AHOyyECtZGrhDgE4S9N5M9vUke1499ZTxna/VTeRh11GP5DucHh7uQy/87XV
         Jgdz7zrWJyRwD+7KYdQHp6GNuvuf46M50X3SCUmnfbXN79IL+g3QhYtS0XSRti/utTFX
         CTwJagTZAqyiwQ99V/22PcODXEY8317wsg+LEN6Vkx2vFg1GZC65yeZof9TnWBsfvFNe
         gLYmRslD5mVew7zvMxBG1et27PRZ5kfdftxkBx5RRH98XhWge1KM8vFbfFCb4mzq6cLe
         oYFqSNgIPEa3dn/H/hqYOhLfDOy9yhehGsWMopN13yVBAbdDl3cdHIwVw0V4aONCOxvx
         8RgA==
X-Gm-Message-State: AOAM531P0R+UU/HLFP9fUjvN8YhWogobyT8UnbOz6r/DHWp0eZXfadyh
        4O1cR+QR9muyp/yXpk9h+O85e7xE16OWF9lcMBjMuQ==
X-Google-Smtp-Source: ABdhPJzHzCU7BbdBqVx5RQF7C+XyISVx53el+ZWJwO1LY3Y/GoFJTacCfYJctvv5+j7DtJeM4ocKuNx7wUV0iUi6QME=
X-Received: by 2002:a2e:b538:: with SMTP id z24mr6460119ljm.478.1607729080569;
 Fri, 11 Dec 2020 15:24:40 -0800 (PST)
MIME-Version: 1.0
References: <20201207081151.7489-1-sergio.paracuellos@gmail.com>
In-Reply-To: <20201207081151.7489-1-sergio.paracuellos@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Dec 2020 00:24:29 +0100
Message-ID: <CACRpkdbXZ2t2w=DJ1ECGj7otNJhqoxq2xt88hBhRVbnkqcA+Gw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mt7621-gpio: convert bindings to YAML format
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 7, 2020 at 9:11 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:

> Convert the mt7621-gpio device tree bindings to the new YAML format.
>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Patch applied with Rob's review tag!

Yours,
Linus Walleij
