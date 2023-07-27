Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA4B765727
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jul 2023 17:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234494AbjG0PPT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jul 2023 11:15:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232667AbjG0PPS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jul 2023 11:15:18 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D96DC2D5F
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jul 2023 08:15:15 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4055c143ca6so7089381cf.3
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jul 2023 08:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690470914; x=1691075714;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1PTasopeMYP2HgvhuvwAZlzG6QAzOuvuTQLzA5fJFQo=;
        b=imT9dXilio3uHriwrc2/dQGqGYnGjaJMr/n9h52qcgGMNXPtXebP+m2ne86Nooia1j
         OtTn/k1IIywli966Okt3On0MrHepzAYHVoZLp2zb6fduCpsOp92SP13hcqcMHN5S8BCa
         Ds3xg/P4jZc/MWkpfnnC/iAOoC9hYNZ3Ob4Klblbhv5vL11COJU7SqKfikE70jgswCyj
         O3QUSsOnQDnvdjAxLUiDfWsyVebZ6HqRzLlbz0dFT5VdS6Em7QWH+W0v6/ckaYLTpVOv
         fE8yMDB5chP/T3tW1beZgjMlpZVFfqaEpevnx9pxGKr+XDJhsxfQCqgwiK+Y7x+/f4cI
         wNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690470914; x=1691075714;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PTasopeMYP2HgvhuvwAZlzG6QAzOuvuTQLzA5fJFQo=;
        b=jUdPPPZnhFADq17sA+XTByD9YM987i2UAS2JZG5kXZm/Jv637zQ/BWYMRt/LtkJRsj
         GYFZiRIDzpq9lmoEydXmvxdptRYdNfjk4UNGs8lePDB5g35zVGfS5IYI5Ue2LU+9MmTo
         RnKq8FYg6BMpjbSoCPKsOZu4YBJLRAXR6RqZn8tGdA8Rs6MExCBuk0tcpEq5lh2eqjIZ
         S8zsr5rk4BMhjqNKWMOa4mFfeEERk7yYYUqXiY1LALve08KTS0dz0oUOjEdPfj8mTqSI
         7kwdEpifmAnYayCN4PoL/IgXq7LZkrY/3P9hBNr4/K/i4YIqOZmBDFkyh0NaKw1fJorV
         uDVg==
X-Gm-Message-State: ABy/qLbv4v6+u7OWYt6b+ybo6fI8bZ1tlN4J0faPfccnyVNcd/o2Yq83
        80DehhYrr3YP8hF7SgvwExV4nNE+qQxOqDDKl+T7FksEl/A=
X-Google-Smtp-Source: APBJJlHZ7TutY85moaFKWbjc+pDzkgFk6R2HMymNmy4Nv5bqMroLCpKSwfnNwcxAw40ZfVH13aXK3OieYu4rBmbjpiE=
X-Received: by 2002:a05:622a:4c6:b0:403:2842:4d09 with SMTP id
 q6-20020a05622a04c600b0040328424d09mr269315qtx.26.1690470914541; Thu, 27 Jul
 2023 08:15:14 -0700 (PDT)
MIME-Version: 1.0
From:   andy pugh <bodgesoc@gmail.com>
Date:   Thu, 27 Jul 2023 16:14:38 +0100
Message-ID: <CAN1+YZU95GyPdE0fDcQNweMCHq0FXQ5RxR5dqmKdmMUaoiMsfw@mail.gmail.com>
Subject: [libgpiod] gpiod_line_get_value_bulk may be broken?
To:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I am using v1.2 on a Raspberry Pi under Buster (as that is the
installed version)

However, the code appears to be the same in v1.6.

As far as I can see gpiod_line_get_value_bulk() always fails if the
bulk contains more than one line. The problem(I think)  is that
gpiod_line_same_chip() always returns -EINVAL

Test code output:

Chips line 0 0x3f1280 gpiochip0
Chips line 1 0x3f2af0 gpiochip0
Chips line 2 0x3f4350 gpiochip0

ie, all the same chip _name_ but the result of gpiod_line_get_chip (if
displayed as a pointer with %p) differs.

Test code

````
#include <gpiod.h>
#include <stdio.h>
#include <unistd.h>
#include <assert.h>
#include <errno.h>
#include <string.h>

int main(int argc, char **argv)
{
  struct gpiod_chip *chip;
  struct gpiod_line *line0, *line1, *line2;
  struct gpiod_line_bulk bulk;
  int retval;
  int val[4] =3D {0};

  // Open GPIO chip
  chip =3D gpiod_chip_open_by_name("gpiochip0");

  // Open GPIO lines
  line0 =3D gpiod_line_find("GPIO17");
  line1 =3D gpiod_line_find("GPIO18");
  line2 =3D gpiod_line_find("GPIO19");

  gpiod_line_request_input(line0, "test");
  gpiod_line_request_input(line1, "test");
  gpiod_line_request_input(line2, "test");

  gpiod_line_bulk_init(&bulk);
  gpiod_line_bulk_add(&bulk, line0);
  gpiod_line_bulk_add(&bulk, line1);
  gpiod_line_bulk_add(&bulk, line2);

  // Compare the return value of gpiod_line_get_chip() for each line
  printf("Chips line 0 %p %s\n", gpiod_line_get_chip(line0),
gpiod_chip_name(gpiod_line_get_chip(line0)));
  printf("Chips line 1 %p %s\n", gpiod_line_get_chip(line1),
gpiod_chip_name(gpiod_line_get_chip(line1)));
  printf("Chips line 2 %p %s\n", gpiod_line_get_chip(line2),
gpiod_chip_name(gpiod_line_get_chip(line2)));

  // try to read the IO lines
  retval =3D gpiod_line_get_value_bulk(&bulk, val);
  assert (retval =3D=3D 0);

  // Release lines and chip
  gpiod_line_release_bulk(&bulk);
  gpiod_chip_close(chip);
  return 0;
}
````

--
atp
"A motorcycle is a bicycle with a pandemonium attachment and is
designed for the especial use of mechanical geniuses, daredevils and
lunatics."
=E2=80=94 George Fitch, Atlanta Constitution Newspaper, 1912
