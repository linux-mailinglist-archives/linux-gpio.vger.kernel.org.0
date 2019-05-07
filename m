Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38DC41695D
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2019 19:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727416AbfEGRiD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 May 2019 13:38:03 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41136 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbfEGRiC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 May 2019 13:38:02 -0400
Received: by mail-oi1-f195.google.com with SMTP id b17so5799359oie.8;
        Tue, 07 May 2019 10:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zejYr5P9JiV4KR1EkhmBRbvHxOzLvVhI6r2OnIBaRd0=;
        b=RrcJGUvSDVZbfl9hZpD4xKaS/X/X4eJ6XNpnE5TvH+8k+M2J4BezoyG0uoPiw1T7Mp
         FNJyR+M+8/EbLI1BtdXnA7FrTybPRf81fPQONlrpduFRI11rcpGZDW8cwIYFWG2HrWiQ
         LRI9jgY3uD+hiJfgtD9soAMao74Sg/iw7l5OrN6HkpglxIDsS96YHHz7wwwjFBepAGWB
         5bn4pwwmXWF2+ym5S9dE+E2o7IcaNQ5s9iGVMyPzeva6LWuLZ4d96j/G9Lxh787YvDVM
         jEsg646vwYrMf0PZQHfWP6Z8WhSkejg4RbFIeCtnD2ZJdZltQ8cFknYVNvNFOUUIJJNX
         HfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zejYr5P9JiV4KR1EkhmBRbvHxOzLvVhI6r2OnIBaRd0=;
        b=P7w7Z2aUsUWqxqcheHfk3dcanUieg2V2ykHZ5WyFuF+evZV92nGIb9eGmb1//L296/
         Fsf1NqJtGPhtRF+y+pkL6LUgXOzUfZW8ApnUo9sbsIXs/yxYfKMEjQJfHInPw/buXx42
         JvxIMiwmYBVGmnteNUIcvl07VBSFSXihrwJuPNIgl+QQBXVSKmhvBALQRpHswa65fU//
         VoJwyNkpYzPeBM5gVClCXFTa+jV5L/m3FKiRsiSllVwj1VRpi7z2uJrvuXzJbh2quD1f
         8JS5UzSXsfAjN6lWS2jAx5B+MtJNQeQnIOMJXX1GiQp6XvSYlx0tjMt4FjN7X7hmR3Ip
         u00Q==
X-Gm-Message-State: APjAAAUvgRuuxnMXclH3s8LyxKdBW7tKsbFWnYGAYpHdwkmK+o8PinSx
        HviVGnKCaKUbPfmF//9u0TnWDzkSNozxi5g6+8M=
X-Google-Smtp-Source: APXvYqyVJ600eKkO90LrXjBVxF5ULSSxyIkNoCzDHXPjvL2K6/VaX5vZILVpcwZqeiW15E86Kikyb6sBuTUNfC7cu/4=
X-Received: by 2002:aca:5b06:: with SMTP id p6mr977542oib.129.1557250681968;
 Tue, 07 May 2019 10:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190507115726.23714-1-glaroque@baylibre.com> <20190507115726.23714-4-glaroque@baylibre.com>
In-Reply-To: <20190507115726.23714-4-glaroque@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Tue, 7 May 2019 19:37:50 +0200
Message-ID: <CAFBinCANc2DmOofmp0QtLGZy8yNNTY2+0+AXQYxsTM5bjWp2zw@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] dt-bindings: pinctrl: meson: Add
 drive-strength-microamp property
To:     Guillaume La Roque <glaroque@baylibre.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        khilman@baylibre.com, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 7, 2019 at 1:57 PM Guillaume La Roque <glaroque@baylibre.com> wrote:
>
> Add optional drive-strength-microamp property
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
