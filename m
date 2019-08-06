Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1EE8298F
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2019 04:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731359AbfHFCSa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 22:18:30 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:36567 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731358AbfHFCSa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 22:18:30 -0400
Received: by mail-oi1-f196.google.com with SMTP id c15so8915723oic.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 19:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=1RixQWRGBRCKP95c35mO4zNDicD1IhXHzQMmV09qSmg=;
        b=hp0jfn0XwgUCJcPMGv65l/LE7RP/+SLuZUiJv8cr6DNnnyYKyuIBqUww172PLgACsv
         ztIgMTJc07ZdXsYF7bGsM9hpCCNdIKOyYVQneDMthXYEzIfo8+DMz1EZB+fe186ZfZLI
         YwnWaVGosJOnsxyGY0vvTUb2QvSnY//KjvR+LnoR/z/awCd1PPmnFCGZuATrBp4sDtqn
         Q1K4Vx+XObUfa6JcH1beAdFMClmM5AlsnrjrNlg7BNQKio1Rck5FTwjHz8i6lcE0a2tF
         AXoC6NPThMvX7Y5SWEcJk8jw6B1PI/FMYyLgXRQco9DUajG82uddaCp+2bgBDOvp6NF1
         W6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=1RixQWRGBRCKP95c35mO4zNDicD1IhXHzQMmV09qSmg=;
        b=HWYgL+lkmIXhmKutuzk7+PzAO5dZnZjf7V/zc2TSKt1Pcu0sb/pTRsPmlZSy+7sxtR
         TSucLbbZh+BMEwQVQobjZ07eHSteuUFVlPUD64MVc8iwdI9cDLPra46Av+xf5GlgKDhb
         xAiXlQKs+LUkeRdGjRap/sPRyedL6DmQ7sgMo9jxm0M1fbjZ+59Zw9ds1Qgz5QRVvgQ0
         ZKUw68q05jUEO5giMtEW4KyoQmbNtwm24ed1YVGRXoAeKPm/Uq6IkGpLaolxsw/P+WB/
         lr8PN2IfkcuqWhH/XacILCbBIU+sIeWfNbcKVolBWcvkO5hkHkPKqdoLmAa1YsIoFCjl
         QMWA==
X-Gm-Message-State: APjAAAUYL0uoECDCYC/ft1s4t+Lm5P2fP3PuEYcFFqrqkTlNbfI96H8Y
        fx4dFVtNWVIB9nMCNGeuxAO2hu3ahjHQaIU/Uns=
X-Google-Smtp-Source: APXvYqxIU2pomDXgZfvHb+vYY7KyrExj0Vonw+fci7lsJBjR5NMwj0Fue7Fpql1di+VDtZ/dTKjmL0urA7NBu2l2HXs=
X-Received: by 2002:aca:4256:: with SMTP id p83mr94508oia.125.1565057908989;
 Mon, 05 Aug 2019 19:18:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:aec9:0:0:0:0:0 with HTTP; Mon, 5 Aug 2019 19:18:27 -0700 (PDT)
From:   Mrs Aisha Gaddafi <2007aisha2007@gmail.com>
Date:   Mon, 5 Aug 2019 19:18:27 -0700
X-Google-Sender-Auth: 0Q3NWFNRjSNNk67OVbLG7hgHQiY
Message-ID: <CADJKOzVgBGyZHUx3e+pJM8VXNvLu=KwRjK1mtc9PHvQwGvCr1g@mail.gmail.com>
Subject: Assalamu alaikum,..
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

QXNzYWxhbXUgYWxhaWt1bSwNCg0KSSBoYXZlIGEgYnVzaW5lc3MgUHJvcG9zYWwgZm9yIHlvdSBh
bmQgSSBuZWVkIG11dHVhbCByZXNwZWN0LCB0cnVzdCwNCmhvbmVzdHksIHRyYW5zcGFyZW5jeSwg
YWRlcXVhdGUgc3VwcG9ydCBhbmQgYXNzaXN0YW5jZSwgSG9wZSB0byBoZWFyDQpmcm9tIHlvdSBm
b3IgbW9yZSBkZXRhaWxzLg0KDQpXYXJtZXN0IHJlZ2FyZHMNCk1ycyBBaXNoYSBHYWRkYWZpDQoN
Ctin2YTYs9mE2KfZhSDYudmE2YrZg9mF2IwNCg0K2YTYr9mKINin2YLYqtix2KfYrSDYudmF2YQg
2YTZgyDZiNij2K3Yqtin2Kwg2KXZhNmJINin2YTYp9it2KrYsdin2YUg2KfZhNmF2KrYqNin2K/Z
hCDZiNin2YTYq9mC2Kkg2YjYp9mE2LXYr9mCINmI2KfZhNi02YHYp9mB2YrYqQ0K2YjYp9mE2K/Y
udmFINin2YTZg9in2YHZiiDZiNin2YTZhdiz2KfYudiv2Kkg2Iwg2YjZhtij2YXZhCDYo9mGINmG
2LPZhdi5INmF2YbZgyDZhNmF2LLZitivINmF2YYg2KfZhNiq2YHYp9i12YrZhC4NCg0K2KPYrdix
INin2YTYqtit2YrYp9iqDQrYp9mE2LPZitiv2Kkg2LnYp9im2LTYqSDYp9mE2YLYsNin2YHZig0K
